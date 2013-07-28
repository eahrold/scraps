# Postprocessing for your info.plist.  Primarily so that we can inject your full dev certificate name.

require 'cgi'
require 'fileutils'

missing_keys = ['BUILD_DIR', 'CODE_SIGN_IDENTITY', 'TARGET_BUILD_DIR', 'INFOPLIST_PATH'] - ENV.keys
raise "Missing required ENV values: #{missing_keys.inspect}" if missing_keys.size > 0

files_to_postprocess = [ENV['INFOPLIST_PATH']]


# FULL_CODE_SIGN_IDENTITY
# -----------------------
dummy_path = "#{ENV['BUILD_DIR']}/CodeSigningDummy"

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

files_to_postprocess.each do |path|
  target_path = File.join(ENV['TARGET_BUILD_DIR'], path)

  input = open(target_path).read
  open(target_path, 'w') do |output|
    # Specify macros via [[[VAR_NAME]]] to avoid clashes w/ regular plist preprocessing.
    output.write input.gsub(/\[\[\[([A-Z_]+)\]\]\]/) { CGI.escapeHTML(ENV[$1]) }
  end
end