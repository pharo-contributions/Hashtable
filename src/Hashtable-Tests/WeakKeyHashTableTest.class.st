Class {
	#name : #WeakKeyHashTableTest,
	#superclass : #TestCase,
	#instVars : [
		'table',
		'testsize'
	],
	#category : #'Hashtable-Tests-Base'
}

{ #category : #running }
WeakKeyHashTableTest >> setUp [
	super setUp.
	table := WeakKeyHashTable new.
	testsize := 100.
]

{ #category : #tests }
WeakKeyHashTableTest >> testAddAll [
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
WeakKeyHashTableTest >> testAddAssoc [

	0 to: testsize do: [ :each |
		self assert: table size equals: each.
		table add: each -> each asString ].
	0 to: testsize do: [ :each |
	self assert: (table at: each) equals: each asString ]
]

{ #category : #tests }
WeakKeyHashTableTest >> testAddCopy [
	| table2 |
	0 to: testsize do: [ :each |
		table add: each -> each asString ].
	table2 := table copy.
	table2 at: testsize + 1 put: true.
	self assert: (table2 includesKey: testsize + 1).
	self deny: (table includesKey: testsize + 1).
]

{ #category : #tests }
WeakKeyHashTableTest >> testAddInteger [

	0 to: testsize do: [ :each |
		self assert: table size equals: each.
		table at: each put: each asString ].
	0 to: testsize do: [ :each |
	self assert: (table at: each) equals: each asString ]
]

{ #category : #tests }
WeakKeyHashTableTest >> testAddNil [

	self deny: (table includesKey: nil).
	self should: [ table at: nil put: 'nil' ] raise: Error.
	self deny: (table includesKey: nil) equals: 'nil'
]

{ #category : #tests }
WeakKeyHashTableTest >> testAddString [

	| keys |
	keys := (0 to: testsize) collect: [ :each | each asString ].
	keys do: [ :each |
		self assert: table size equals: each asNumber.
		table at: each put: each asNumber ].
	keys := (0 to: testsize) collect: [ :each | each asString ].
	keys do: [ :each |
		self assert: (table at: each) equals: each asNumber ]
]

{ #category : #tests }
WeakKeyHashTableTest >> testComma [
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
WeakKeyHashTableTest >> testEqualsDictionary [

	| dictionary |
	dictionary := Dictionary new.
	0 to: testsize do: [ :each |
		dictionary at: each put: each asString.
		table at: each put: each asString ].
	self assert: table equals: dictionary
]

{ #category : #tests }
WeakKeyHashTableTest >> testEqualsTransitive [

	| table2 |
	table2 := table species new.
	0 to: testsize do: [ :each |
		table2 at: each put: each asString.
		table at: each put: each asString ].
	self assert: table equals: table2.
	self assert: table2 equals: table
]

{ #category : #tests }
WeakKeyHashTableTest >> testKeys [

	| keys |
	keys := (1 to: 100) asOrderedCollection.
	keys do: [ :each | table at: each put: each asString ].
	self assert: table keys asArray sort equals: (1 to: 100) asArray
]

{ #category : #tests }
WeakKeyHashTableTest >> testKeysAndValuesDo [

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
WeakKeyHashTableTest >> testKeysDo [

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
WeakKeyHashTableTest >> testRemoveInteger [

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
WeakKeyHashTableTest >> testRemoveString [

	| keys |
	keys := (0 to: testsize) collect: [ :each | each asString ].
	keys do: [ :each |
		self assert: table size equals: each asNumber.
		table at: each put: each asNumber ].

	0 to: testsize by: 2 do: [ :each |
		self assert: (table includesKey: (keys at: each + 1)).
		table removeKey: each asString.
		self deny: (table includesKey: each asString) ].

	1 to: testsize by: 2 do: [ :each |
	self assert: (table at: each asString) equals: each ]
]

{ #category : #tests }
WeakKeyHashTableTest >> testSize [

	| keys |
	keys := (1 to: testsize) collect: [ :each | each asString ].
	self assert: table size equals: 0.

	keys do: [ :each |
		table at: each put: each asNumber.
		self assert: table size equals: each asNumber ].

	1 to: testsize do: [ :each |
		self assert: table size equals: testsize.
		self assert: (table at: each asString) equals: each ].

	testsize to: 1 by: -1 do: [ :each |
		self assert: table size equals: each.
		table removeKey: each asString ].
	self assert: table size equals: 0
]

{ #category : #tests }
WeakKeyHashTableTest >> testValues [

	| keys |
	keys := (1 to: 100) asOrderedCollection collect: [ :each |
		        each asString ].
	keys do: [ :each | table at: each put: each ].
	self
		assert: (table values collect: [ :each | each asNumber ]) asArray sort
		equals: (1 to: 100) asArray
]

{ #category : #tests }
WeakKeyHashTableTest >> testValuesDo [

	| keys |
	keys := (1 to: 100) asOrderedCollection.
	keys do: [ :each |
		table at: each put: each ].
	table valuesDo: [ :each |
		self assert: (keys includes: each).
		keys remove: each ifAbsent: [ self fail ] ].
	self assert: keys isEmpty
]

{ #category : #tests }
WeakKeyHashTableTest >> testWeakInstance [

	| createBlock string |
	createBlock := [
	               (String new: 3)
		               at: 1 put: $n;
		               at: 2 put: $e;
		               at: 3 put: $w;
		               yourself ].
	string := createBlock value.

	table at: string put: true.
	self assert: (table at: string).
	self assert: (table at: createBlock value).
	self assert: table size equals: 1.
	string := nil.
	Smalltalk garbageCollect.

	string := createBlock value.
	self deny: (table includesKey: string).
	self assert: table isEmpty
]
