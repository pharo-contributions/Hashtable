Class {
	#name : #HashBagTest,
	#superclass : #TestCase,
	#instVars : [
		'bag'
	],
	#category : #'Hashtable-Tests-Base'
}

{ #category : #running }
HashBagTest >> setUp [
	super setUp.
	bag := HashBag new.
]

{ #category : #tests }
HashBagTest >> testAdd [

	bag add: 1.
	bag add: 1.
	self assert: (bag occurrencesOf: 1) equals: 2
]

{ #category : #tests }
HashBagTest >> testAddWithOccurrances [

	bag add: 1 withOccurrences: 2.
	self assert: (bag occurrencesOf: 1) equals: 2
]

{ #category : #tests }
HashBagTest >> testCopy [

	| copy |
	bag add: 1.
	copy := bag copy.
	self assert: (bag occurrencesOf: 1) equals: 1.
	self assert: (copy occurrencesOf: 1) equals: 1.

	copy remove: 1.
	self assert: (bag occurrencesOf: 1) equals: 1.
	self assert: (copy occurrencesOf: 1) equals: 0
]

{ #category : #tests }
HashBagTest >> testRemove [

	bag add: 1 withOccurrences: 2.
	bag remove: 1.
	self assert: (bag occurrencesOf: 1) equals: 1.

	bag remove: 1.
	self assert: (bag occurrencesOf: 1) equals: 0.

	self should: [ bag remove: 1 ] raise: Error.
	self assert: (bag occurrencesOf: 1) equals: 0
]
