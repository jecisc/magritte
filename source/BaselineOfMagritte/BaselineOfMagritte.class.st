Class {
	#name : #BaselineOfMagritte,
	#superclass : #BaselineOf,
	#category : 'BaselineOfMagritte'
}

{ #category : #baselines }
BaselineOfMagritte >> baseline: spec [
	<baseline>
	spec
		for: #common
		do: [ self
				grease: spec;
				seaside3: spec.

			spec
				package: 'Magritte-Model'
					with: [ spec
						requires: #('Grease');
						includes: #('Magritte-Pharo-Model') ];
				package: 'Magritte-Pharo-Model' with: [ spec requires: #('Magritte-Model') ];
				package: 'Magritte-Tests-Model' with: [ spec requires: #('Magritte-Model' 'Magritte-Pharo-Model') ];
				package: 'Magritte-Seaside' with: [ spec requires: #('Magritte-Model' 'Seaside3') ];
				package: 'Magritte-Bootstrap' with: [ spec requires: #('Magritte-Model') ];
				package: 'Magritte-Deprecated' with: [ spec requires: #('Magritte-Model') ];
				package: 'Magritte-Merging' with: [ spec requires: #('Magritte-Model') ];
				package: 'Magritte-Morph' with: [ spec requires: #('Magritte-Model') ];
				package: 'Magritte-Pharo-Tools' with: [ spec requires: #('Magritte-Deprecated') ].

			spec
				group: 'Core' with: #('Magritte-Model');
				group: 'Tests' with: #('Magritte-Tests-Model');
				group: 'Seaside' with: #('Magritte-Seaside');
				group: 'Deprecated' with: #('Magritte-Deprecated');
				group: 'Tools' with: #('Magritte-Pharo-Tools');
				group: 'Morphic' with: #('Magritte-Morph');
				group: 'default' with: 'Morphic' ]
]

{ #category : #baselines }
BaselineOfMagritte >> grease: spec [
	spec
		baseline: 'Grease'
		with:
			[ spec repository: 'github://SeasideSt/Grease:v1.4.x/repository' ]
]

{ #category : #baselines }
BaselineOfMagritte >> seaside3: spec [
	spec
		baseline: 'Seaside3'
		with:
			[ "note: we do not want to depend on Zinc, since this is not present in Squeak. Currently no adapter is loaded"
			spec
				repository: 'github://SeasideSt/Seaside:v3.4.x/repository';
				loads: #('Core') ]
]
