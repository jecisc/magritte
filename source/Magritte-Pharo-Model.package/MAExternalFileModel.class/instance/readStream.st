accessing-dynamic
readStream
	^ SystemVersion current major >= 7
		ifTrue: [ self file binaryReadStream ]
		ifFalse: [ self file readStream binary ]