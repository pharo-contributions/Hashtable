Class {
	#name : #ObjectTester,
	#superclass : #Object,
	#instVars : [
		'instances'
	],
	#category : #'Hashtable-Objects'
}

{ #category : #testing }
ObjectTester class >> testAll [

	<script>
	self new testAll
]

{ #category : #'initialize-release' }
ObjectTester >> initialize [
	super initialize.
	self instances: 1000000
]

{ #category : #accessing }
ObjectTester >> instances [
	^instances
]

{ #category : #accessing }
ObjectTester >> instances: anInteger [ 
	instances := anInteger
]

{ #category : #testing }
ObjectTester >> test: aClass on: aStream [
	aStream nextPutAll: aClass name.
	aStream tab.
	aStream nextPutAll: [
		1 to: self instances do: [ :each |
			aClass new ] ] timeToRun asString
]

{ #category : #testing }
ObjectTester >> testAll [

	| stream |
	stream := ZnCharacterWriteStream on:
		          (File named: 'classes-creationdata') writeStream.
	self testClasses
		do: [ :each |
			self
				trace: 'Testing: ';
				traceCr: each name.
			self test: each on: stream ]
		separatedBy: [ stream cr ].
	stream close.
	self traceCr: 'done'
]

{ #category : #accessing }
ObjectTester >> testClasses [
	^Array
		with: Object
		with: CVAutoincrementObject
		with: CIVAutoincrementObject		
		with: RandomObject
]
