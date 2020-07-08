Class {
	#name : #UnoChecker,
	#superclass : #Object,
	#instVars : [
		'stream',
		'currentLine',
		'players',
		'playerNumber',
		'actions',
		'actionIndex'
	],
	#category : #UnoChecker
}

{ #category : #'as yet unclassified' }
UnoChecker >> actionLine: aString [ 
	
	| cl splitString |
	actionIndex := actionIndex + 1.
	splitString := aString splitOn: Character space.
	cl := UnoAction subclasses detect: [ :cls | cls canDigest: splitString ].
	actions add: (cl newFrom: splitString).

]

{ #category : #'as yet unclassified' }
UnoChecker >> arePlayersValid [
	^ playerNumber = players size
]

{ #category : #'as yet unclassified' }
UnoChecker >> currentAction [ 	
	^ actions at: actionIndex
]

{ #category : #operate }
UnoChecker >> currentLine [
	currentLine := stream upTo: Character cr.
	^ currentLine
]

{ #category : #accessing }
UnoChecker >> extractPlayerNumberDeclaration [
	| line |
	line := self currentLine.
	(self isPlayerNumberValid: line)
		ifTrue: [ playerNumber := (line readStream upTo: Character space) asNumber ]
		ifFalse: [ self error: 'Line ', line, 'is not correct' ]
]

{ #category : #accessing }
UnoChecker >> extractPlayers [ 

"	1 to: self numberOfPlayers do: [ :index | 
		| line |
		line := self currentLine.
		line first isDigit 
			ifTrue: [ UnoError signal: 'The number of player is not consistent with the player list' ].
		players add: line ]"
	
	| line | 
	[ line := self currentLine.
	line first isDigit ] whileFalse: [ players add: line ]
]

{ #category : #initialization }
UnoChecker >> initialize [

	super initialize.
	players := OrderedCollection new.
	actions := OrderedCollection new.
	actionIndex := 0. 
]

{ #category : #testing }
UnoChecker >> isPlayerNumberValid: aLine [
	| array |
	array := aLine splitOn: Character space.
	array size = 2 ifFalse: [ ^ false ].
	(array first allSatisfy: [ :c | c isDigit ])
		 ifFalse: [ ^ false ].
	array first asNumber isNumber ifFalse: [ ^ false ].
	^ array second = 'players'
]

{ #category : #accessing }
UnoChecker >> numberOfPlayers [
	^ playerNumber 
]

{ #category : #accessing }
UnoChecker >> players [
	^ players
]

{ #category : #accessing }
UnoChecker >> stream: aReadStream [ 
	stream := aReadStream
]
