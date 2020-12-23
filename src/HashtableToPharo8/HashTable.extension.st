Extension { #name : #HashTable }

{ #category : #'*HashtableToPharo8' }
HashTable >> keysSortedSafely [
	"This method is override in version before Pharo8 to ensure compatibility from Pharo 8"
	"Answer a SortedCollection containing the receiver's keys."
	| sortedKeys |
	sortedKeys := SortedCollection new: self size.
	sortedKeys sortBlock:
		[:x :y |  "Should really be use <obj, string, num> compareSafely..."
			[ x < y ]
				ifError: [x printString < y printString] ].
	self keysDo: [ :each | sortedKeys add: each].
	^ sortedKeys
]
