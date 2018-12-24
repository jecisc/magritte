Extension { #name : #MAExternalFileModel }

{ #category : #'*Magritte-Seaside' }
MAExternalFileModel >> url [
	^ self baseUrl isNil
		ifTrue: [ super url ]
		ifFalse: [ self baseUrl , '/' , (self location reduce: [ :a :b | a , '/' , b ]) , '/' , self filename ]
]
