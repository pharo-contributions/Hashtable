"
I am a replacement for IdentitySet that uses chaining instead of linear probing for collision resolution.

This results in a much better performance for big Collections.
"
Class {
	#name : #IdentityHashSet,
	#superclass : #HashSet,
	#category : #'Hashtable-Base'
}

{ #category : #private }
IdentityHashSet >> hashFor: anObject [

	^ anObject identityHash
]

{ #category : #private }
IdentityHashSet >> is: anObject sameAs: anotherObject [

	^ anObject == anotherObject
]
