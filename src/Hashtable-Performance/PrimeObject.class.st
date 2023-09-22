Class {
	#name : #PrimeObject,
	#superclass : #Object,
	#category : #'Hashtable-Performance-Objects'
}

{ #category : #comparing }
PrimeObject >> hash [

	^ self identityHash * 100799
]
