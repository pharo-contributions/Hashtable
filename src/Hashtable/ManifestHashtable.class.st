"
Please describe the package using the class comment of the included manifest class. The manifest class also includes other additional metadata for the package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : #ManifestHashtable,
	#superclass : #PackageManifest,
	#category : #'Hashtable-Manifest'
}

{ #category : #'code-critics' }
ManifestHashtable class >> ruleBadMessageRule2V1FalsePositive [

	<ignoreForCoverage>
	^ #(#(#(#RGMethodDefinition #(#HashSet #= #false)) #'2023-09-22T09:46:11.445535+02:00') )
]

{ #category : #'code-critics' }
ManifestHashtable class >> ruleCollectionProtocolRuleV1FalsePositive [

	<ignoreForCoverage>
	^ #(#(#(#RGMethodDefinition #(#HashSet #addAll: #false)) #'2023-09-22T09:47:05.900065+02:00') #(#(#RGMethodDefinition #(#HashSet #collect: #false)) #'2023-09-22T09:47:23.916826+02:00') #(#(#RGMethodDefinition #(#HashSet #select: #false)) #'2023-09-22T09:48:25.998366+02:00') )
]

{ #category : #'code-critics' }
ManifestHashtable class >> ruleDetectContainsRuleV1FalsePositive [

	<ignoreForCoverage>
	^ #(#(#(#RGMethodDefinition #(#HashSet #= #false)) #'2023-09-22T09:52:03.981835+02:00') )
]

{ #category : #'code-critics' }
ManifestHashtable class >> ruleLiteralArrayContainsSuspiciousTrueFalseOrNilRuleV1FalsePositive [

	<ignoreForCoverage>
	^ #(#(#(#RGMetaclassDefinition #(#'ManifestHashtable class' #ManifestHashtable)) #'2023-09-22T09:46:27.032436+02:00') )
]
