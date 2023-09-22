Class {
	#name : #PrimeObject,
	#superclass : #Object,
	#category : #'Hashtable-Performance'
}

{ #category : #comparing }
PrimeObject >> hash [

	^ self identityHash * 100799
]
