baselines
baselineForPharo: spec
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


	spec
		for: #pharo
		do: [ spec package: 'Glamour-Magritte-Presentations' with: [ spec repository: 'http://www.smalltalkhub.com/mc/Moose/Glamour/main' ].
			spec package: 'Magritte-GT' with: [ spec requires: #('Morphic' 'Glamour-Magritte-Presentations') ].
			spec group: 'default' with: #('Magritte-GT') ].
	spec
		for: #squeakCommon
		do: [ spec
				package: 'Magritte-Tests-Model' with: [ spec includes: #('Magritte-Tests-Pharo-Model') ];
				package: 'Magritte-Seaside' with: [ spec includes: #('Magritte-Pharo-Seaside') ];
				package: 'Magritte-Pharo-Seaside' with: [ spec requires: #('Magritte-Seaside') ];
				package: 'Magritte-Morph' with: [ spec requires: #('Magritte-Model') ];
				package: 'Magritte-Pharo-Tools' with: [ spec requires: #('Magritte-Deprecated') ].
			spec
				group: 'Tools' with: #('Magritte-Pharo-Tools');
				group: 'Morphic' with: #('Magritte-Morph');
				group: 'default' with: 'Morphic' ]