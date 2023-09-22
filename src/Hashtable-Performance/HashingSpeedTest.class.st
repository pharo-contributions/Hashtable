"
Abstract superclass for speed tests
"
Class {
	#name : #HashingSpeedTest,
	#superclass : #Object,
	#category : #'Hashtable-Performance'
}

{ #category : #testing }
HashingSpeedTest class >> isAbstract [

	^ self == HashingSpeedTest
]

{ #category : #accessing }
HashingSpeedTest >> fileStreamForFileNamed: aFileName [

	^ ZnCharacterWriteStream on: (File named: aFileName) writeStream
]
