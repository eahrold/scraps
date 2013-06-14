/*
 * Copyright (c) 1999-2004,2008 Apple Inc. All Rights Reserved.
 * 
 * @APPLE_LICENSE_HEADER_START@
 * 
 * This file contains Original Code and/or Modifications of Original Code
 * as defined in and that are subject to the Apple Public Source License
 * Version 2.0 (the 'License'). You may not use this file except in
 * compliance with the License. Please obtain a copy of the License at
 * http://www.opensource.apple.com/apsl/ and read it before using this
 * file.
 * 
 * The Original Code and all software distributed under the License are
 * distributed on an 'AS IS' basis, WITHOUT WARRANTY OF ANY KIND, EITHER
 * EXPRESS OR IMPLIED, AND APPLE HEREBY DISCLAIMS ALL SUCH WARRANTIES,
 * INCLUDING WITHOUT LIMITATION, ANY WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE, QUIET ENJOYMENT OR NON-INFRINGEMENT.
 * Please see the License for the specific language governing rights and
 * limitations under the License.
 * 
 * @APPLE_LICENSE_HEADER_END@
 *
 * oidscert.h -- Object Identifiers for X509 Certificate Library
 */

#ifndef _OIDSCERT_H_
#define _OIDSCERT_H_  1

#include <Security/cssmconfig.h>
#include <Security/cssmtype.h>
#include <Security/oidsbase.h>

#ifdef __cplusplus
extern "C" {
#endif

#define INTEL_X509V3_CERT_R08 INTEL_SEC_FORMATS, 1, 1
#define INTEL_X509V3_CERT_R08_LENGTH INTEL_SEC_FORMATS_LENGTH + 2

/* Prefix for defining Certificate Extension field OIDs */
#define INTEL_X509V3_CERT_PRIVATE_EXTENSIONS INTEL_X509V3_CERT_R08, 50
#define INTEL_X509V3_CERT_PRIVATE_EXTENSIONS_LENGTH INTEL_X509V3_CERT_R08_LENGTH + 1

/* Prefix for defining signature field OIDs */
#define INTEL_X509V3_SIGN_R08 INTEL_SEC_FORMATS, 3, 2
#define INTEL_X509V3_SIGN_R08_LENGTH INTEL_SEC_FORMATS_LENGTH + 2

/* Suffix specifying format or representation of a field value                                      */
/* Note that if a format suffix is not specified, a flat data representation is implied. */

#define INTEL_X509_C_DATATYPE					1
#define INTEL_X509_LDAPSTRING_DATATYPE		2

/* Certificate OIDS */
extern const CSSM_OID

	CSSMOID_X509V3SignedCertificate DEPRECATED_IN_MAC_OS_X_VERSION_10_7_AND_LATER, 
	CSSMOID_X509V3SignedCertificateCStruct DEPRECATED_IN_MAC_OS_X_VERSION_10_7_AND_LATER, 
	CSSMOID_X509V3Certificate DEPRECATED_IN_MAC_OS_X_VERSION_10_7_AND_LATER, 
	CSSMOID_X509V3CertificateCStruct DEPRECATED_IN_MAC_OS_X_VERSION_10_7_AND_LATER, 
	CSSMOID_X509V1Version DEPRECATED_IN_MAC_OS_X_VERSION_10_7_AND_LATER, 
	CSSMOID_X509V1SerialNumber DEPRECATED_IN_MAC_OS_X_VERSION_10_7_AND_LATER, 
	CSSMOID_X509V1IssuerName DEPRECATED_IN_MAC_OS_X_VERSION_10_7_AND_LATER, 			// normalized & encoded
	CSSMOID_X509V1IssuerNameStd DEPRECATED_IN_MAC_OS_X_VERSION_10_7_AND_LATER, 		// encoded
	CSSMOID_X509V1IssuerNameCStruct DEPRECATED_IN_MAC_OS_X_VERSION_10_7_AND_LATER, 	// CSSM_X509_NAME
	CSSMOID_X509V1IssuerNameLDAP DEPRECATED_IN_MAC_OS_X_VERSION_10_7_AND_LATER, 
	CSSMOID_X509V1ValidityNotBefore DEPRECATED_IN_MAC_OS_X_VERSION_10_7_AND_LATER, 
	CSSMOID_X509V1ValidityNotAfter DEPRECATED_IN_MAC_OS_X_VERSION_10_7_AND_LATER, 
	CSSMOID_X509V1SubjectName DEPRECATED_IN_MAC_OS_X_VERSION_10_7_AND_LATER, 			// normalized & encoded
	CSSMOID_X509V1SubjectNameStd DEPRECATED_IN_MAC_OS_X_VERSION_10_7_AND_LATER, 		// encoded
	CSSMOID_X509V1SubjectNameCStruct DEPRECATED_IN_MAC_OS_X_VERSION_10_7_AND_LATER, 	// CSSM_X509_NAME
	CSSMOID_X509V1SubjectNameLDAP DEPRECATED_IN_MAC_OS_X_VERSION_10_7_AND_LATER, 
	CSSMOID_CSSMKeyStruct DEPRECATED_IN_MAC_OS_X_VERSION_10_7_AND_LATER, 
	CSSMOID_X509V1SubjectPublicKeyCStruct DEPRECATED_IN_MAC_OS_X_VERSION_10_7_AND_LATER, 
	CSSMOID_X509V1SubjectPublicKeyAlgorithm DEPRECATED_IN_MAC_OS_X_VERSION_10_7_AND_LATER, 
	CSSMOID_X509V1SubjectPublicKeyAlgorithmParameters DEPRECATED_IN_MAC_OS_X_VERSION_10_7_AND_LATER, 
	CSSMOID_X509V1SubjectPublicKey DEPRECATED_IN_MAC_OS_X_VERSION_10_7_AND_LATER, 
	CSSMOID_X509V1CertificateIssuerUniqueId DEPRECATED_IN_MAC_OS_X_VERSION_10_7_AND_LATER, 
	CSSMOID_X509V1CertificateSubjectUniqueId DEPRECATED_IN_MAC_OS_X_VERSION_10_7_AND_LATER, 
	CSSMOID_X509V3CertificateExtensionsStruct DEPRECATED_IN_MAC_OS_X_VERSION_10_7_AND_LATER, 
	CSSMOID_X509V3CertificateExtensionsCStruct DEPRECATED_IN_MAC_OS_X_VERSION_10_7_AND_LATER, 
	CSSMOID_X509V3CertificateNumberOfExtensions DEPRECATED_IN_MAC_OS_X_VERSION_10_7_AND_LATER, 
	CSSMOID_X509V3CertificateExtensionStruct DEPRECATED_IN_MAC_OS_X_VERSION_10_7_AND_LATER, 
	CSSMOID_X509V3CertificateExtensionCStruct DEPRECATED_IN_MAC_OS_X_VERSION_10_7_AND_LATER, 
	CSSMOID_X509V3CertificateExtensionId DEPRECATED_IN_MAC_OS_X_VERSION_10_7_AND_LATER, 
	CSSMOID_X509V3CertificateExtensionCritical DEPRECATED_IN_MAC_OS_X_VERSION_10_7_AND_LATER, 
	CSSMOID_X509V3CertificateExtensionType DEPRECATED_IN_MAC_OS_X_VERSION_10_7_AND_LATER, 
	CSSMOID_X509V3CertificateExtensionValue DEPRECATED_IN_MAC_OS_X_VERSION_10_7_AND_LATER, 
	
	/* Signature OID Fields */
	CSSMOID_X509V1SignatureStruct DEPRECATED_IN_MAC_OS_X_VERSION_10_7_AND_LATER, 
	CSSMOID_X509V1SignatureCStruct DEPRECATED_IN_MAC_OS_X_VERSION_10_7_AND_LATER, 
	CSSMOID_X509V1SignatureAlgorithm DEPRECATED_IN_MAC_OS_X_VERSION_10_7_AND_LATER, 
	CSSMOID_X509V1SignatureAlgorithmTBS DEPRECATED_IN_MAC_OS_X_VERSION_10_7_AND_LATER, 
	CSSMOID_X509V1SignatureAlgorithmParameters DEPRECATED_IN_MAC_OS_X_VERSION_10_7_AND_LATER, 
	CSSMOID_X509V1Signature DEPRECATED_IN_MAC_OS_X_VERSION_10_7_AND_LATER, 
	
	/* Extension OID Fields */
	CSSMOID_SubjectSignatureBitmap DEPRECATED_IN_MAC_OS_X_VERSION_10_7_AND_LATER, 
	CSSMOID_SubjectPicture DEPRECATED_IN_MAC_OS_X_VERSION_10_7_AND_LATER, 
	CSSMOID_SubjectEmailAddress DEPRECATED_IN_MAC_OS_X_VERSION_10_7_AND_LATER, 
	CSSMOID_UseExemptions DEPRECATED_IN_MAC_OS_X_VERSION_10_7_AND_LATER;

/*** 
 *** Apple addenda
 ***/
 
/* 
 * Standard Cert and CRL extensions.
 */
extern const CSSM_OID
	CSSMOID_SubjectDirectoryAttributes DEPRECATED_IN_MAC_OS_X_VERSION_10_7_AND_LATER, 
	CSSMOID_SubjectKeyIdentifier DEPRECATED_IN_MAC_OS_X_VERSION_10_7_AND_LATER, 
	CSSMOID_KeyUsage DEPRECATED_IN_MAC_OS_X_VERSION_10_7_AND_LATER, 
	CSSMOID_PrivateKeyUsagePeriod DEPRECATED_IN_MAC_OS_X_VERSION_10_7_AND_LATER, 
	CSSMOID_SubjectAltName DEPRECATED_IN_MAC_OS_X_VERSION_10_7_AND_LATER, 
	CSSMOID_IssuerAltName DEPRECATED_IN_MAC_OS_X_VERSION_10_7_AND_LATER, 
	CSSMOID_BasicConstraints DEPRECATED_IN_MAC_OS_X_VERSION_10_7_AND_LATER, 
	CSSMOID_CrlNumber DEPRECATED_IN_MAC_OS_X_VERSION_10_7_AND_LATER, 
	CSSMOID_CrlReason DEPRECATED_IN_MAC_OS_X_VERSION_10_7_AND_LATER, 
	CSSMOID_HoldInstructionCode DEPRECATED_IN_MAC_OS_X_VERSION_10_7_AND_LATER, 
	CSSMOID_InvalidityDate DEPRECATED_IN_MAC_OS_X_VERSION_10_7_AND_LATER, 
	CSSMOID_DeltaCrlIndicator DEPRECATED_IN_MAC_OS_X_VERSION_10_7_AND_LATER, 
	CSSMOID_IssuingDistributionPoint DEPRECATED_IN_MAC_OS_X_VERSION_10_7_AND_LATER, 
	CSSMOID_IssuingDistributionPoints DEPRECATED_IN_MAC_OS_X_VERSION_10_7_AND_LATER, 
	CSSMOID_CertIssuer DEPRECATED_IN_MAC_OS_X_VERSION_10_7_AND_LATER, 
	CSSMOID_NameConstraints DEPRECATED_IN_MAC_OS_X_VERSION_10_7_AND_LATER, 
	CSSMOID_CrlDistributionPoints DEPRECATED_IN_MAC_OS_X_VERSION_10_7_AND_LATER, 
	CSSMOID_CertificatePolicies DEPRECATED_IN_MAC_OS_X_VERSION_10_7_AND_LATER, 
	CSSMOID_PolicyMappings DEPRECATED_IN_MAC_OS_X_VERSION_10_7_AND_LATER, 
	CSSMOID_PolicyConstraints DEPRECATED_IN_MAC_OS_X_VERSION_10_7_AND_LATER, 
	CSSMOID_AuthorityKeyIdentifier DEPRECATED_IN_MAC_OS_X_VERSION_10_7_AND_LATER, 
	CSSMOID_ExtendedKeyUsage DEPRECATED_IN_MAC_OS_X_VERSION_10_7_AND_LATER, 
	CSSMOID_InhibitAnyPolicy DEPRECATED_IN_MAC_OS_X_VERSION_10_7_AND_LATER, 
	CSSMOID_AuthorityInfoAccess DEPRECATED_IN_MAC_OS_X_VERSION_10_7_AND_LATER, 
	CSSMOID_BiometricInfo DEPRECATED_IN_MAC_OS_X_VERSION_10_7_AND_LATER, 
	CSSMOID_QC_Statements DEPRECATED_IN_MAC_OS_X_VERSION_10_7_AND_LATER, 
	CSSMOID_SubjectInfoAccess DEPRECATED_IN_MAC_OS_X_VERSION_10_7_AND_LATER, 
	CSSMOID_ExtendedKeyUsageAny DEPRECATED_IN_MAC_OS_X_VERSION_10_7_AND_LATER, 
	CSSMOID_ServerAuth DEPRECATED_IN_MAC_OS_X_VERSION_10_7_AND_LATER, 
	CSSMOID_ClientAuth DEPRECATED_IN_MAC_OS_X_VERSION_10_7_AND_LATER, 
	CSSMOID_ExtendedUseCodeSigning DEPRECATED_IN_MAC_OS_X_VERSION_10_7_AND_LATER, 
	CSSMOID_EmailProtection DEPRECATED_IN_MAC_OS_X_VERSION_10_7_AND_LATER, 
	CSSMOID_TimeStamping DEPRECATED_IN_MAC_OS_X_VERSION_10_7_AND_LATER, 
	CSSMOID_OCSPSigning DEPRECATED_IN_MAC_OS_X_VERSION_10_7_AND_LATER, 
	CSSMOID_KERBv5_PKINIT_KP_CLIENT_AUTH DEPRECATED_IN_MAC_OS_X_VERSION_10_7_AND_LATER, 
	CSSMOID_KERBv5_PKINIT_KP_KDC DEPRECATED_IN_MAC_OS_X_VERSION_10_7_AND_LATER, 
	CSSMOID_EKU_IPSec DEPRECATED_IN_MAC_OS_X_VERSION_10_7_AND_LATER, 
	CSSMOID_DOTMAC_CERT_EXTENSION DEPRECATED_IN_MAC_OS_X_VERSION_10_7_AND_LATER, 
	CSSMOID_DOTMAC_CERT_IDENTITY DEPRECATED_IN_MAC_OS_X_VERSION_10_7_AND_LATER, 
	CSSMOID_DOTMAC_CERT_EMAIL_SIGN DEPRECATED_IN_MAC_OS_X_VERSION_10_7_AND_LATER, 
	CSSMOID_DOTMAC_CERT_EMAIL_ENCRYPT DEPRECATED_IN_MAC_OS_X_VERSION_10_7_AND_LATER, 
	CSSMOID_APPLE_CERT_POLICY DEPRECATED_IN_MAC_OS_X_VERSION_10_7_AND_LATER, 
	CSSMOID_DOTMAC_CERT_POLICY DEPRECATED_IN_MAC_OS_X_VERSION_10_7_AND_LATER, 
	CSSMOID_ADC_CERT_POLICY DEPRECATED_IN_MAC_OS_X_VERSION_10_7_AND_LATER, 
	CSSMOID_MACAPPSTORE_CERT_POLICY DEPRECATED_IN_MAC_OS_X_VERSION_10_7_AND_LATER,
	CSSMOID_MACAPPSTORE_RECEIPT_CERT_POLICY DEPRECATED_IN_MAC_OS_X_VERSION_10_7_AND_LATER,
	CSSMOID_APPLEID_CERT_POLICY DEPRECATED_IN_MAC_OS_X_VERSION_10_7_AND_LATER,
	CSSMOID_APPLEID_SHARING_CERT_POLICY DEPRECATED_IN_MAC_OS_X_VERSION_10_7_AND_LATER,
	CSSMOID_APPLE_EKU_CODE_SIGNING DEPRECATED_IN_MAC_OS_X_VERSION_10_7_AND_LATER,  
	CSSMOID_APPLE_EKU_CODE_SIGNING_DEV DEPRECATED_IN_MAC_OS_X_VERSION_10_7_AND_LATER, 
	CSSMOID_APPLE_EKU_RESOURCE_SIGNING DEPRECATED_IN_MAC_OS_X_VERSION_10_7_AND_LATER, 
	CSSMOID_APPLE_EKU_ICHAT_SIGNING DEPRECATED_IN_MAC_OS_X_VERSION_10_7_AND_LATER, 
	CSSMOID_APPLE_EKU_ICHAT_ENCRYPTION DEPRECATED_IN_MAC_OS_X_VERSION_10_7_AND_LATER, 
	CSSMOID_APPLE_EKU_SYSTEM_IDENTITY DEPRECATED_IN_MAC_OS_X_VERSION_10_7_AND_LATER, 
	CSSMOID_APPLE_EXTENSION DEPRECATED_IN_MAC_OS_X_VERSION_10_7_AND_LATER, 
	CSSMOID_APPLE_EXTENSION_CODE_SIGNING DEPRECATED_IN_MAC_OS_X_VERSION_10_7_AND_LATER, 
	CSSMOID_APPLE_EXTENSION_APPLE_SIGNING DEPRECATED_IN_MAC_OS_X_VERSION_10_7_AND_LATER, 
	CSSMOID_APPLE_EXTENSION_ADC_DEV_SIGNING DEPRECATED_IN_MAC_OS_X_VERSION_10_7_AND_LATER, 
	CSSMOID_APPLE_EXTENSION_ADC_APPLE_SIGNING DEPRECATED_IN_MAC_OS_X_VERSION_10_7_AND_LATER,
	CSSMOID_APPLE_EXTENSION_MACAPPSTORE_RECEIPT DEPRECATED_IN_MAC_OS_X_VERSION_10_7_AND_LATER,
	CSSMOID_APPLE_EXTENSION_INTERMEDIATE_MARKER DEPRECATED_IN_MAC_OS_X_VERSION_10_7_AND_LATER,
	CSSMOID_APPLE_EXTENSION_WWDR_INTERMEDIATE DEPRECATED_IN_MAC_OS_X_VERSION_10_7_AND_LATER,
	CSSMOID_APPLE_EXTENSION_ITMS_INTERMEDIATE DEPRECATED_IN_MAC_OS_X_VERSION_10_7_AND_LATER,
	CSSMOID_APPLE_EXTENSION_AAI_INTERMEDIATE DEPRECATED_IN_MAC_OS_X_VERSION_10_7_AND_LATER,
	CSSMOID_APPLE_EXTENSION_APPLEID_INTERMEDIATE DEPRECATED_IN_MAC_OS_X_VERSION_10_7_AND_LATER,
	CSSMOID_APPLE_EXTENSION_APPLEID_SHARING DEPRECATED_IN_MAC_OS_X_VERSION_10_7_AND_LATER
;
	
/*
 * Netscape extensions.
 */
extern const CSSM_OID	
	CSSMOID_NetscapeCertType DEPRECATED_IN_MAC_OS_X_VERSION_10_7_AND_LATER, 
	CSSMOID_NetscapeCertSequence DEPRECATED_IN_MAC_OS_X_VERSION_10_7_AND_LATER, 
	CSSMOID_NetscapeSGC DEPRECATED_IN_MAC_OS_X_VERSION_10_7_AND_LATER;

extern const CSSM_OID CSSMOID_MicrosoftSGC DEPRECATED_IN_MAC_OS_X_VERSION_10_7_AND_LATER;

/*
 * Field values for CSSMOID_NetscapeCertType DEPRECATED_IN_MAC_OS_X_VERSION_10_7_AND_LATER,  a bit string.
 * Assumes a 16 bit field, even though currently only 8 bits
 * are defined. 
 */
#define CE_NCT_SSL_Client	0x8000
#define CE_NCT_SSL_Server	0x4000
#define CE_NCT_SMIME		0x2000
#define CE_NCT_ObjSign		0x1000
#define CE_NCT_Reserved		0x0800
#define CE_NCT_SSL_CA		0x0400
#define CE_NCT_SMIME_CA		0x0200
#define CE_NCT_ObjSignCA	0x0100

#ifdef __cplusplus
}
#endif

#endif /* _OIDSCERT_H_ */
