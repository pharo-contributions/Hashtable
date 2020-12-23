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
	spec for: #common do: [ "Packages"
		spec
			package: 'Hashtable';
			package: 'Hashtable-Tests' with: [ spec requires: #( 'Hashtable' ) ].

		spec for: #( #'pharo3.x' #'pharo4.x' #'pharo5.x' #'pharo6.x' #'pharo7.x' #'pharo8.x') do: [ 
			spec
				package: 'HashtableToPharo8' with: [ spec requires: #( 'Hashtable' ) ];
				package: 'Hashtable'.
			spec group: #default with: #( 'HashtableToPharo8' ) ] ].

	"Groups"
	spec
	group: 'Core' with: #( 'Hashtable' );
	group: 'Tests' with: #( 'Hashtable-Tests' ) 
]

{ #category : #accessing }
BaselineOfHashtable >> projectClass [
	^ MetacelloCypressBaselineProject
]
