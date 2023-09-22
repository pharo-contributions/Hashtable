Class {
	#name : #HashTableTest,
	#superclass : #TestCase,
	#instVars : [
		'table',
		'testsize'
	],
	#category : #'Hashtable-Tests-Base'
}

{ #category : #running }
HashTableTest >> setUp [
	super setUp.
	table := HashTable new.
	testsize := 100.
]

{ #category : #tests }
HashTableTest >> testAddAll [
	"(self run: #testAddAll)"

	| table2 |
	table at: #a put: 1.
	table at: #b put: 2.

	table2 := table species new.
	table2 at: #a put: 3.
	table2 at: #c put: 4.

	table addAll: table2.
	self assert: (table at: #a) equals: 3.
	self assert: (table at: #b) equals: 2.
	self assert: (table at: #c) equals: 4
]

{ #category : #tests }
HashTableTest >> testAddAssoc [

	0 to: testsize do: [ :each |
		self assert: table size equals: each.
		table add: each -> each asString ].
	0 to: testsize do: [ :each |
	self assert: (table at: each) equals: each asString ]
]

{ #category : #tests }
HashTableTest >> testAddCopy [

	| table2 |
	0 to: testsize do: [ :each |
		table add: each -> each asString ].
	table2 := table copy.
	table2 at: testsize + 1 put: true.
	self assert: (table2 includesKey: testsize + 1).
	self deny: (table includesKey: testsize + 1).
]

{ #category : #tests }
HashTableTest >> testAddInteger [

	0 to: testsize do: [ :each |
		self assert: table size equals: each.
		table at: each put: each asString ].
	0 to: testsize do: [ :each |
	self assert: (table at: each) equals: each asString ]
]

{ #category : #tests }
HashTableTest >> testAddNil [

	self deny: (table includesKey: nil).
	table at: nil put: 'nil'.
	self assert: (table at: nil) equals: 'nil'.

	self assert: (table includesKey: nil).

	table at: nil put: 'ok'.
	self assert: (table at: nil) equals: 'ok'.

	table removeKey: nil.
	self deny: (table includesKey: nil)
]

{ #category : #tests }
HashTableTest >> testAddString [

	0 to: testsize do: [ :each |
		self assert: table size equals: each.
		table at: each asString put: each ].
	0 to: testsize do: [ :each |
	self assert: (table at: each asString) equals: each ]
]

{ #category : #tests }
HashTableTest >> testAssociactionssDo [

	| keys |
	keys := (1 to: 100) asOrderedCollection.
	keys do: [ :each | table at: each put: each ].
	table associationsDo: [ :assoc |
		self assert: assoc key equals: assoc value.
		self assert: (keys includes: assoc key).
		keys remove: assoc key ifAbsent: [ self fail ] ].
	self assert: keys isEmpty
]

{ #category : #tests }
HashTableTest >> testComma [
	"(self run: #testComma)"

	| table1 table2 |
	table at: #a put: 1.
	table at: #b put: 2.

	table1 := table species new.
	table1 at: #a put: 3.
	table1 at: #c put: 4.

	table2 := table , table1.
	self assert: (table2 at: #a) equals: 3.
	self assert: (table2 at: #b) equals: 2.
	self assert: (table2 at: #c) equals: 4
]

{ #category : #tests }
HashTableTest >> testEqualsDictionary [

	| dictionary |
	dictionary := Dictionary new.
	0 to: testsize do: [ :each |
		dictionary at: each put: each asString.
		table at: each put: each asString ].
	self assert: table equals: dictionary
]

{ #category : #tests }
HashTableTest >> testEqualsTransitive [

	| table2 |
	table2 := table species new.
	0 to: testsize do: [ :each |
		table2 at: each put: each asString.
		table at: each put: each asString ].
	self assert: table equals: table2.
	self assert: table2 equals: table
]

{ #category : #tests }
HashTableTest >> testKeys [

	| keys |
	keys := (1 to: 100) asOrderedCollection.
	keys do: [ :each | table at: each put: each asString ].
	self assert: table keys asArray sort equals: (1 to: 100) asArray
]

{ #category : #tests }
HashTableTest >> testKeysAndValuesDo [

	| keys |
	keys := (1 to: 100) asOrderedCollection.
	keys do: [ :each | table at: each put: each ].
	table keysAndValuesDo: [ :key :value |
		self assert: key equals: value.
		self assert: (keys includes: key).
		keys remove: key ifAbsent: [ self fail ] ].
	self assert: keys isEmpty
]

{ #category : #tests }
HashTableTest >> testKeysDo [

	| keys |
	keys := (1 to: 100) asOrderedCollection.
	keys do: [ :each |
		table at: each put: each ].
	table keysDo: [ :each |
		self assert: (keys includes: each).
		keys remove: each ifAbsent: [ self fail ] ].
	self assert: keys isEmpty
]

{ #category : #tests }
HashTableTest >> testRemoveFromCopy [

	| original copy |
	original := HashTable new.
	($a to: $z) do: [ :each | original at: each put: each ].
	copy := original copy.
	copy removeKey: $b.
	self assert: (original at: $b) equals: $b
]

{ #category : #tests }
HashTableTest >> testRemoveInteger [

	0 to: testsize do: [ :each |
		self assert: table size equals: each.
		table at: each put: each asString ].

	0 to: testsize by: 2 do: [ :each |
		self assert: (table includesKey: each).
		table removeKey: each.
		self deny: (table includesKey: each) ].

	1 to: testsize by: 2 do: [ :each |
	self assert: (table at: each) equals: each asString ]
]

{ #category : #tests }
HashTableTest >> testRemoveString [

	0 to: testsize do: [ :each |
		self assert: table size equals: each.
		table at: each asString put: each ].

	0 to: testsize by: 2 do: [ :each |
		self assert: (table includesKey: each asString).
		table removeKey: each asString.
		self deny: (table includesKey: each asString) ].

	1 to: testsize by: 2 do: [ :each |
	self assert: (table at: each asString) equals: each ]
]

{ #category : #tests }
HashTableTest >> testSize [

	self assert: table size equals: 0.

	1 to: testsize do: [ :each |
		table at: each asString put: each.
		self assert: table size equals: each ].

	1 to: testsize do: [ :each |
		self assert: table size equals: testsize.
		self assert: (table at: each asString) equals: each ].

	testsize to: 1 by: -1 do: [ :each |
		self assert: table size equals: each.
		table removeKey: each asString ].
	self assert: table size equals: 0
]

{ #category : #tests }
HashTableTest >> testValues [

	| keys |
	keys := (1 to: 100) asOrderedCollection.
	keys do: [ :each | table at: each asString put: each ].
	self assert: table values asArray sort equals: (1 to: 100) asArray
]

{ #category : #tests }
HashTableTest >> testValuesDo [

	| keys |
	keys := (1 to: 100) asOrderedCollection.
	keys do: [ :each |
		table at: each put: each ].
	table valuesDo: [ :each |
		self assert: (keys includes: each).
		keys remove: each ifAbsent: [ self fail ] ].
	self assert: keys isEmpty
]
