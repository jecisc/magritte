accessing-dynamic
writeStream
	^ SystemVersion current major >= 7
		ifTrue: [ self file binaryWriteStream ]
		ifFalse: [ self file writeStream binary ]