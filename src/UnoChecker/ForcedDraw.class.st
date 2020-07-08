Class {
	#name : #ForcedDraw,
	#superclass : #UnoAction,
	#instVars : [
		'power',
		'level'
	],
	#category : #UnoChecker
}

{ #category : #testing }
ForcedDraw class >> canDigest: aSplitLine [
	aSplitLine isEmpty | aSplitLine first isEmpty
		ifTrue: [ ^ false ].
	^ aSplitLine first first = $+

	
]

{ #category : #accessing }
ForcedDraw >> fromSplitString: aCollection [ 
	level := aCollection first second asString asNumber.
	color := aCollection second.
	player := aCollection third
	
]

{ #category : #accessing }
ForcedDraw >> level [ 
	^ level
]

{ #category : #accessing }
ForcedDraw >> name [ 

	^'forced'
]

{ #category : #accessing }
ForcedDraw >> player [
	^ player
]
