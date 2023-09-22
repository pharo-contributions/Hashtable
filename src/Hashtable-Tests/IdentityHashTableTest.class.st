Class {
	#name : #IdentityHashTableTest,
	#superclass : #TestCase,
	#instVars : [
		'table',
		'testsize'
	],
	#category : #'Hashtable-Tests-Base'
}

{ #category : #running }
IdentityHashTableTest >> setUp [
	super setUp.
	table := IdentityHashTable new.
	testsize := 100.
]

{ #category : #tests }
IdentityHashTableTest >> testAddAndModifyString [

	| key value |
	key := String newFrom: 'testme!'.
	value := 1.
	table at: key put: value.
	self assert: (table at: key) equals: value.

	key at: 1 put: $x.
	self assert: (table at: key) equals: value
]

{ #category : #tests }
IdentityHashTableTest >> testAddEqualStrings [

	| key1 key2 value1 value2 |
	key1 := String newFrom: 'testme!'.
	key2 := String newFrom: 'testme!'.

	self assert: key1 ~~ key2.

	value1 := 1.
	value2 := 2.

	table at: key1 put: value1.
	table at: key2 put: value2.
	self assert: (table at: key1) equals: value1.
	self assert: (table at: key2) equals: value2
]

{ #category : #tests }
IdentityHashTableTest >> testAddSymbol [

	0 to: testsize do: [ :each |
		self assert: table size equals: each.
		table at: each asString asSymbol put: each ].
	0 to: testsize do: [ :each |
		self assert: (table at: each asString asSymbol) equals: each ]
]

{ #category : #tests }
IdentityHashTableTest >> testRemoveSymbol [

	0 to: testsize do: [ :each |
		self assert: table size equals: each.
		table at: each asString asSymbol put: each ].

	0 to: testsize by: 2 do: [ :each |
		self assert: (table includesKey: each asString asSymbol).
		table removeKey: each asString asSymbol.
		self deny: (table includesKey: each asString asSymbol) ].

	1 to: testsize by: 2 do: [ :each |
		self assert: (table at: each asString asSymbol) equals: each ]
]
