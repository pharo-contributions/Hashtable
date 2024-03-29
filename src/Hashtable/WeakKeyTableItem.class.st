"
Table item within a hash table with a weak key
"
Class {
	#name : #WeakKeyTableItem,
	#superclass : #TableItem,
	#category : #'Hashtable-Base'
}

{ #category : #accessing }
WeakKeyTableItem >> key [

	^ key first
]

{ #category : #accessing }
WeakKeyTableItem >> key: anObject [

	key := WeakArray with: anObject.
	keyHash := anObject hash
]
