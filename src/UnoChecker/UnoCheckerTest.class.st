Class {
	#name : #UnoCheckerTest,
	#superclass : #TestCase,
	#category : #UnoChecker
}

{ #category : #'tests - players' }
UnoCheckerTest >> testArePlayerValid [
	| checker |
	checker := UnoChecker new stream: '6 players
Alice
Bob
Carol
Dave
Erin
Frank
' readStream.
	checker extractPlayerNumberDeclaration.

	self shouldnt: [ checker extractPlayers ] raise: UnoError.
	self assert: checker arePlayersValid 
]

{ #category : #'tests - players' }
UnoCheckerTest >> testNumberOfPlayers [
	| checker |
	checker := UnoChecker new stream: '6 players
Alice
Bob
Carol
Dave
Erin
Frank
' readStream.
	checker extractPlayerNumberDeclaration.
	self assert: checker numberOfPlayers equals: 6
]

{ #category : #'tests - players' }
UnoCheckerTest >> testPlayerLineShouldBeANumberFollowedByPlayers [
	| checker |
	checker := UnoChecker new.
	self deny: (checker isPlayerNumberValid: 'aa 28').
	self deny: (checker isPlayerNumberValid: 'a1223z 28').
	self deny: (checker isPlayerNumberValid: '5 zozozoz').
	self deny: (checker isPlayerNumberValid: '6 tata players').
	self assert: (checker isPlayerNumberValid: '12 players')
]

{ #category : #'tests - players' }
UnoCheckerTest >> testPlayers [
	| checker |
	checker := UnoChecker new stream: '6 players
Alice
Bob
Carol
Dave
Erin
Frank
' readStream.
	checker extractPlayerNumberDeclaration.
	checker extractPlayers.
	self
		assert: checker players asArray
		equals: #( 'Alice' 'Bob' 'Carol' 'Dave' 'Erin' 'Frank' )
]

{ #category : #'tests - players' }
UnoCheckerTest >> testTooFewPlayers [
	| checker |
	checker := UnoChecker new stream: '6 players
Alice
Bob
Carol
Dave
8 red
5 red Alice
' readStream.
	checker extractPlayerNumberDeclaration.
	self should: [ checker extractPlayers ] raise: UnoError.

]

{ #category : #'tests - players' }
UnoCheckerTest >> testTooManyPlayers [
	| checker |
	self skip.
	checker := UnoChecker new stream: '3 players
Alice
Bob
Carol
Dave
' readStream.
	checker extractPlayerNumberDeclaration.
	self should: [ checker extractPlayers ] raise: UnoError.

]
