"
I am a replacement for IdentityBag that uses chaining instead of linear probing for collision resolution.

This results in a much better performance for big Collections.
"
Class {
	#name : #IdentityHashBag,
	#superclass : #Bag,
	#category : #'Hashtable-Base'
}

{ #category : #'instance creation' }
IdentityHashBag class >> contentsClass [

	^ IdentityHashTable
]
