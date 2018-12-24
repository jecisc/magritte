baselines
baseline: spec
	<baseline>
	spec
		for: #common
		do: [ self
				grease: spec;
				seaside3: spec.
				
			spec
				package: 'Magritte-Model' with: [ spec requires: #('Grease') ];
				package: 'Magritte-Tests-Model' with: [ spec requires: #('Magritte-Model'); includes: #('Magritte-Tests-Pharo-Model') ];
				package: 'Magritte-Seaside' with: [ spec requires: #('Magritte-Model' 'Seaside3'); includes: #('Magritte-Pharo-Seaside') ];
				package: 'Magritte-Bootstrap' with: [ spec requires: #('Magritte-Model') ];
				package: 'Magritte-Deprecated' with: [ spec requires: #('Magritte-Model') ];
				package: 'Magritte-Merging' with: [ spec requires: #('Magritte-Model') ];
				package: 'Magritte-Pharo-Seaside' with: [ spec requires: #('Magritte-Seaside') ];
				package: 'Magritte-Morph' with: [ spec requires: #('Magritte-Model') ];
				package: 'Magritte-Pharo-Tools' with: [ spec requires: #('Magritte-Deprecated') ].
				
			spec
				group: 'Core' with: #('Magritte-Model');
				group: 'Tests' with: #('Magritte-Tests-Model');
				group: 'Seaside' with: #('Magritte-Seaside');
				group: 'Deprecated' with: #('Magritte-Deprecated');
				group: 'Tools' with: #('Magritte-Pharo-Tools');
				group: 'Morphic' with: #('Magritte-Morph');
				group: 'default' with: 'Morphic' ].
	spec
		for: #(#'pharo6.x')
		do: [ spec
				package: 'Magritte-Pharo3-Model' with: [ spec requires: #('Magritte-Model') ];
				package: 'Magritte-Tests-Pharo-Model' with: [ spec requires: #('Magritte-Pharo3-Model') ];
				package: 'Magritte-Model' with: [ spec includes: #('Magritte-Pharo3-Model') ];
				" create a temporary alias "
					package: 'Magritte-Pharo-Model' with: 'Magritte-Pharo3-Model' ].
	spec
		for: #(#'pharo7.x')
		do: [ spec
				package: 'Magritte-Pharo7-Model' with: [ spec requires: #('Magritte-Model') ];
				package: 'Magritte-Tests-Pharo-Model' with: [ spec requires: #('Magritte-Pharo7-Model') ];
				package: 'Magritte-Model' with: [ spec includes: #('Magritte-Pharo7-Model') ];
				" create a temporary alias "
					package: 'Magritte-Pharo-Model' with: 'Magritte-Pharo7-Model' ].