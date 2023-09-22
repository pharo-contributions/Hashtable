"
Please describe the package using the class comment of the included manifest class. The manifest class also includes other additional metadata for the package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : #ManifestHashtableTests,
	#superclass : #PackageManifest,
	#category : #'Hashtable-Tests-Manifest'
}

{ #category : #'code-critics' }
ManifestHashtableTests class >> ruleLiteralArrayContainsSuspiciousTrueFalseOrNilRuleV1FalsePositive [

	<ignoreForCoverage>
	^ #(#(#(#RGMetaclassDefinition #(#'ManifestHashtableTests class' #ManifestHashtableTests)) #'2023-09-22T09:35:09.505155+02:00') )
]

{ #category : #'code-critics' }
ManifestHashtableTests class >> ruleReVariableAssignedLiteralRuleV1FalsePositive [

	<ignoreForCoverage>
	^ #(#(#(#RGClassDefinition #(#WeakKeyIdentityHashTableTest)) #'2023-09-22T09:36:25.110011+02:00') #(#(#RGClassDefinition #(#IdentityHashTableTest)) #'2023-09-22T09:36:33.581103+02:00') #(#(#RGClassDefinition #(#WeakKeyHashTableTest)) #'2023-09-22T09:36:40.941255+02:00') #(#(#RGClassDefinition #(#HashTableTest)) #'2023-09-22T09:36:48.071013+02:00') )
]

{ #category : #'code-critics' }
ManifestHashtableTests class >> ruleStringConcatenationRuleV1FalsePositive [

	<ignoreForCoverage>
	^ #(#(#(#RGMethodDefinition #(#WeakKeyIdentityHashTableTest #testKeys #false)) #'2023-09-22T09:32:39.135192+02:00') #(#(#RGMethodDefinition #(#WeakKeyIdentityHashTableTest #testValues #false)) #'2023-09-22T09:33:14.724377+02:00') )
]

{ #category : #'code-critics' }
ManifestHashtableTests class >> ruleUnoptimizedToDoRuleV1FalsePositive [

	<ignoreForCoverage>
	^ #(#(#(#RGMethodDefinition #(#HashTableTest #testRemoveFromCopy #false)) #'2023-09-22T09:26:38.857908+02:00') )
]
