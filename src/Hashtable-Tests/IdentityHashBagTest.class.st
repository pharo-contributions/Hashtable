Class {
	#name : #IdentityHashBagTest,
	#superclass : #TestCase,
	#instVars : [
		'bag'
	],
	#category : #'Hashtable-Tests-Base'
}

{ #category : #running }
IdentityHashBagTest >> setUp [
	super setUp.
	bag := IdentityHashBag new.
]

{ #category : #tests }
IdentityHashBagTest >> testAdd [

	| first second |
	first := String newFrom: 'key'.
	second := String newFrom: 'key'.

	bag add: first.
	bag add: first.

	bag add: second.
	bag add: second.
	bag add: second.
	self assert: (bag occurrencesOf: first) equals: 2.
	self assert: (bag occurrencesOf: second) equals: 3
]

{ #category : #tests }
IdentityHashBagTest >> testAddWithOccurrances [

	| first second |
	first := String newFrom: 'key'.
	second := String newFrom: 'key'.

	bag add: first withOccurrences: 2.
	bag add: second withOccurrences: 3.
	self assert: (bag occurrencesOf: first) equals: 2
]

{ #category : #tests }
IdentityHashBagTest >> testRemove [

	| first second |
	first := String newFrom: 'key'.
	second := String newFrom: 'key'.

	bag add: first withOccurrences: 2.
	bag add: second withOccurrences: 3.
	bag remove: first.
	self assert: (bag occurrencesOf: first) equals: 1.

	bag remove: first.
	self assert: (bag occurrencesOf: first) equals: 0.

	self should: [ bag remove: first ] raise: Error.
	self assert: (bag occurrencesOf: first) equals: 0.
	self assert: (bag occurrencesOf: second) equals: 3
]
