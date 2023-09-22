"
An object with a random hash
"
Class {
	#name : #RandomObject,
	#superclass : #Object,
	#instVars : [
		'hash'
	],
	#category : #'Hashtable-Performance'
}

{ #category : #comparing }
RandomObject >> hash [

	^ hash
]

{ #category : #initialization }
RandomObject >> initialize [
	super initialize.
	hash := SmallInteger maxVal atRandom
]
