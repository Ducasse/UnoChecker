Class {
	#name : #Numbered,
	#superclass : #UnoAction,
	#instVars : [
		'number'
	],
	#category : #UnoChecker
}

{ #category : #testing }
Numbered class >> canDigest: aSplitLine [
	aSplitLine isEmpty | aSplitLine first isEmpty
		ifTrue: [ ^ false ].
	^ aSplitLine first first isDigit

	
]

{ #category : #'as yet unclassified' }
Numbered >> fromSplitString: aCollection [ 
	
	number := aCollection first asNumber. 
	color := aCollection second.
	player := aCollection third
	
]

{ #category : #'as yet unclassified' }
Numbered >> name [ 

	^ 'numbered'
]

{ #category : #'as yet unclassified' }
Numbered >> player [
	^ player
]
