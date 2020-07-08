Class {
	#name : #UnoCheckerTest,
	#superclass : #TestCase,
	#category : #UnoChecker
}

{ #category : #tests }
UnoCheckerTest >> testNumberOfPlayers [
	
	| checker |
	checker := UnoChecker new 
		stream: 
'6 players
Alice
Bob
Carol
Dave
Erin
Frank
' readStream.
	self assert: checker numberOfPlayers equals: 6
]
