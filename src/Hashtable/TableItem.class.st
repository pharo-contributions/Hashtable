"
Table item within a hash table
"
Class {
	#name : #TableItem,
	#superclass : #Object,
	#instVars : [
		'key',
		'value',
		'keyHash',
		'next'
	],
	#category : #'Hashtable-Base'
}

{ #category : #'instance creation' }
TableItem class >> key: aKey value: aValue [

	^ self new
		  key: aKey;
		  value: aValue;
		  yourself
]

{ #category : #'instance creation' }
TableItem class >> key: aKey value: aValue next: anItem [

	^ self new
		  key: aKey;
		  value: aValue;
		  next: anItem;
		  yourself
]

{ #category : #accessing }
TableItem >> key [

	^ key
]

{ #category : #accessing }
TableItem >> key: anObject [

	key := anObject
]

{ #category : #accessing }
TableItem >> keyHash [

	^ keyHash
]

{ #category : #accessing }
TableItem >> keyHash: anIngeter [

	keyHash := anIngeter
]

{ #category : #accessing }
TableItem >> next [

	^ next
]

{ #category : #accessing }
TableItem >> next: anObject [

	next := anObject
]

{ #category : #copying }
TableItem >> postCopy [

	super postCopy.
	next ifNotNil: [ next := next copy ]
]

{ #category : #printing }
TableItem >> printOn: aStream [

	super printOn: aStream.
	aStream
		nextPutAll: ' key: ';
		nextPutAll: self key asString;
		nextPutAll: ' value: ';
		nextPutAll: self value asString
]

{ #category : #public }
TableItem >> setAsNil [

	self
		next: nil;
		key: nil;
		keyHash: nil;
		value: nil
]

{ #category : #evaluating }
TableItem >> value [

	^ value
]

{ #category : #accessing }
TableItem >> value: anObject [

	value := anObject
]
