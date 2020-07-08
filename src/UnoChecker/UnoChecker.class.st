Class {
	#name : #UnoChecker,
	#superclass : #Object,
	#instVars : [
		'stream',
		'currentLine',
		'players',
		'playerNumber'
	],
	#category : #UnoChecker
}

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
	1 to: self numberOfPlayers do: [ :index | 
			"players at: index put: self currentLine"
			players add: self currentLine ]
]

{ #category : #initialization }
UnoChecker >> initialize [

	super initialize.
	players := OrderedCollection new
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
