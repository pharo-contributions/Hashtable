"
Please describe the package using the class comment of the included manifest class. The manifest class also includes other additional metadata for the package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : #ManifestBaselineOfHashtable,
	#superclass : #PackageManifest,
	#category : #'BaselineOfHashtable-Manifest'
}

{ #category : #'code-critics' }
ManifestBaselineOfHashtable class >> ruleClassNotReferencedRuleV1FalsePositive [

	<ignoreForCoverage>
	^ #(#(#(#RGClassDefinition #(#BaselineOfHashtable)) #'2023-09-22T08:48:02.461031+02:00') )
]
