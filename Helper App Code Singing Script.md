	# Generic preprocessing for ${ENV_VAR} with output to the build dir.

	require 'cgi'
	require 'fileutils'

	missing_keys = ['BUILD_DIR', 'CODE_SIGN_IDENTITY', 'PREPROCESS_FILES', 'PREPROCESS_DIR'] - ENV.keys
	raise "Missing required ENV values: #{missing_keys.inspect}" if missing_keys.size > 0

	# SMJ_PREPROCESS_FILES is a comma-separated list of *relative* file paths to preprocess
	#  and spit out into the SMJ_PREPROCESS_DIR (w/ the same relative paths as given)
	files_to_preprocess = ENV['PREPROCESS_FILES'].split(',').map(&:strip)


	# Environment Cleanup
	# -------------------
	dummy_path = "#{ENV['BUILD_DIR']}/SMJobKitCodeSigningDummy"

	identity = ENV['CODE_SIGN_IDENTITY']
	# If you use the generic code signing identity, chances are that it'll conflict.
	#identity = "#{identity}:" if identity.end_with? ' Developer'

	# We can't seem to get direct access to the code signing certificate that Xcode has
	# selected at this point :(
	`touch #{dummy_path}`
	`codesign --force --sign "#{identity}" "#{dummy_path}"`
	result = `codesign --display --verbose --verbose "#{dummy_path}" 2>&1`
	`rm #{dummy_path}`

	ENV['FULL_CODE_SIGN_IDENTITY'] = result[/Authority\=(.*#{Regexp.escape(identity)}.*)/, 1]


	# Actual Preprocessing
	# --------------------

	files_to_preprocess.each do |path|
	target_path = File.join(ENV['SMJ_PREPROCESS_DIR'], path)
	FileUtils.mkpath File.dirname(target_path)

	open(path) do |input|
	open(target_path, 'w') do |output|
	# Specify macros via ${VAR_NAME} in the preprocessed file.  Same as regular
	# Info.plist preprocessing.
	output.write input.read.gsub(/\$\{([A-Z_]+)\}/) { CGI.escapeHTML(ENV[$1]) }
	end
	puts target_path
	end
	end