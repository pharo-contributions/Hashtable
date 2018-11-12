"
Baseline of the Hashtable project
"
Class {
	#name : #BaselineOfHashtable,
	#superclass : #BaselineOf,
	#category : #BaselineOfHashtable
}

{ #category : #baseline }
BaselineOfHashtable >> baseline: spec [
	<baseline>
	spec for: #common do: [ "Packages" spec package: 'Hashtable' ]
]
