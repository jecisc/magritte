Extension { #name : #Object }

{ #category : #'*magritte-model-accessing' }
Object >> basicMagritteDescription [
	^ MAPragmaBuilder for: self
]

{ #category : #'*Magritte-Model' }
Object >> descriptionContainer [
	"Return the default description container."
	<magritteContainer>
	^ MAPriorityContainer new
		label: self class label;
		yourself
]

{ #category : #'*magritte-model-model' }
Object >> initializeMagritte [
	"Initializes the receiving object with the default values of its description."

	self magritteDescription do: [ :each |
		each isReadonly
			ifFalse: [ self write: each default using: each ] ]
]

{ #category : #'*magritte-model-testing' }
Object >> isDescription [
	^ false
]

{ #category : #'*Magritte-Model' }
Object >> maLazyFrom: description [
	"Return the current value of a field as specified by its description

	Usage: 
		MyDomainObject>>#getter
			^ self maLazyFrom: self descriptionName
		
		MyDomainObject>>#descriptionName
			^ MAStringDescription new
					accessor: #name;
					default: 'Alan';
					yourself"

	| currentValue defaultValue |
	currentValue := self readUsing: description.
	currentValue ifNotNil: [ ^ currentValue ].
	defaultValue := description default.
	self write: defaultValue using: description.
	^ defaultValue
]

{ #category : #'*Magritte-Model' }
Object >> maPrintOn: aStream [
	"Print the current values of all described fields. Customize the printing of a field with the #maPrintString property, which should store a valuable with the value of the field as an optional argument"
	
	self magritteDescription
		do: [ :d | 
			| value |
			value := d read: self.
			value ifNotNil: [ 
				| stringValue |
				stringValue := d 
					propertyAt: #maPrintString
					ifPresent: [ :map | map cull: value ]
					ifAbsent: [ d toString: value ].
				aStream nextPutAll: stringValue ] ]
		separatedBy: [ aStream space ]
]

{ #category : #'*magritte-model-actions' }
Object >> magritteActionDescriptions [

	^ self uniqueActionSelectors collect: [ :each | self perform: each ]
]

{ #category : #'*magritte-model-builder' }
Object >> magritteDescription [
	|basicDescription builders|
	basicDescription := self basicMagritteDescription.
	builders := self magritteDescriptionBuilders.
	builders ifNotNil: [^builders buildFrom: basicDescription target: self].
	^basicDescription
]

{ #category : #'*Magritte-Model' }
Object >> magritteDescriptionBuilders [
	|builderPragmas container|
	builderPragmas := Pragma allNamed: #magritteBuilder from: self class to: Object.
	builderPragmas ifEmpty: [ ^nil ].
	container := QCDescriptionBuilderContainer new.
	builderPragmas do: [ :pragma |
		|bld |
		pragma method numArgs = 0 ifTrue: [ 
			bld := self perform: pragma method selector.
			bld ifNotNil: [ container add: bld ] ] ].
	^container
]

{ #category : #'*magritte-model-description' }
Object class >> magritteTemplate [
	"Allow subclasses to have a prototype instance for creating a Magritte description (especially reference description)."
	^self new
]

{ #category : #'*Magritte-Model' }
Object >> mementoClass [
	"Return a class to be used to remember or cache the receiver, namely a memento object."

	^ MACheckedMemento
]

{ #category : #'*Magritte-Model' }
Object >> readUsing: aDescription [
	"Dispatch the read-access to the receiver using the accessor of aDescription."

	^ aDescription accessor read: self
]

{ #category : #'*Magritte-Model' }
Object >> uniqueActionSelectors [

	| descriptionPragmas selectors |	
	descriptionPragmas := Pragma 
		allNamed: #magritteActionDescription
		from: self class to: Object.
		
	selectors := descriptionPragmas collect: [ :each | each method selector ].
	
	^ Set withAll: selectors
]

{ #category : #'*Magritte-Model' }
Object >> write: anObject using: aDescription [
	"Dispatch the write-access to the receiver of anObject using the accessor of aDescription."

	aDescription accessor write: anObject to: self
]
