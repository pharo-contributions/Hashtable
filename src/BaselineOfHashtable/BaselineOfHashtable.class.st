"
Baseline of the Hashtable project
"
Class {
	#name : #BaselineOfHashtable,
	#superclass : #BaselineOf,
	#category : #'BaselineOfHashtable-Base'
}

{ #category : #baselines }
BaselineOfHashtable >> baseline: spec [

	<baseline>
	spec for: #common do: [ 
		"Packages"
		spec
			package: 'Hashtable';
			package: 'Hashtable-Tests' with: [ spec requires: #( 'Hashtable' ) ];
			package: 'Hashtable-Performance' with: [ spec requires: #( 'Hashtable' ) ].

		spec for: #( #'pharo3.x' #'pharo4.x' #'pharo5.x' #'pharo6.x' #'pharo7.x' #'pharo8.x') do: [ 
			spec
				package: 'HashtableToPharo8' with: [ spec requires: #( 'Hashtable' ) ];
				package: 'Hashtable'.
			spec
				group: 'Core' with: #( 'HashtableToPharo8' 'Hashtable' ) ] ].

	"Groups"
	spec
		group: 'Core' with: #( 'Hashtable' );
		group: 'Performance' with: #( 'Hashtable-Performance' );		
		group: 'Tests' with: #( 'Hashtable-Tests'); 
		group: 'CI' with: #( 'Tests'); 		
		group: 'all' with: #( 'Core' 'Performance' 'Tests');
		group: 'default' with: #( 'all')		
]
