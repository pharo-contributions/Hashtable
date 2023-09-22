"
Testing various objects
"
Class {
	#name : #ObjectTester,
	#superclass : #HashingSpeedTest,
	#instVars : [
		'instances'
	],
	#category : #'Hashtable-Performance'
}

{ #category : #testing }
ObjectTester class >> testAll [
	<script>
	self new testAll
]

{ #category : #initialization }
ObjectTester >> initialize [

	super initialize.
	self instances: 1000000
]

{ #category : #accessing }
ObjectTester >> instances [

	^ instances
]

{ #category : #accessing }
ObjectTester >> instances: anInteger [

	instances := anInteger
]

{ #category : #tests }
ObjectTester >> test: aClass on: aStream [

	aStream nextPutAll: aClass name.
	aStream tab.
	aStream nextPutAll: [
		1 to: self instances do: [ :each |
			aClass new ] ] timeToRun asString
]

{ #category : #tests }
ObjectTester >> testAll [
	<script: 'self testAll'>
	
	| stream |
	stream := self fileStreamForFileNamed: 'classes-creationdata'.
	self testClasses
		do: [ :each | 
			Transcript show: 'Testing: '; show: each name; cr.
			self test: each on: stream]
		separatedBy: [ stream cr].
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
