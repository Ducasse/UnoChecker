Class {
	#name : #UnoCheckerTest,
	#superclass : #TestCase,
	#category : #UnoChecker
}

{ #category : #'tests - players play' }
UnoCheckerTest >> testAlice [
	| player |
	player := UnoPlayer new.
	player name: 'Alice'.
	self assert: player cardCount equals: 7.
	
]

{ #category : #'tests - players play' }
UnoCheckerTest >> testAliceDrawsACard [
	| player |
	player := UnoPlayer new.
	player name: 'Alice'.
	player drawsACard.
	self assert: player cardCount equals: 8.
	
	
]

{ #category : #'tests - players play' }
UnoCheckerTest >> testAlicePlaysACard [
	| player |
	player := UnoPlayer new.
	player name: 'Alice'.
	player playACard.
	self assert: player cardCount equals: 6.
	
	
]

{ #category : #'tests - player declaration' }
UnoCheckerTest >> testArePlayerValid [
	| checker |
	checker := UnoChecker new stream: '6 players
Alice
Bob
Carol
Dave
Erin
Frank
7 red
' readStream.
	checker extractPlayerNumberDeclaration.
	checker extractPlayers.
	self assert: checker arePlayersValid 
]

{ #category : #'tests - player declaration' }
UnoCheckerTest >> testBogusPlayers [
	| checker |
	checker := UnoChecker new stream: '6 players
Alice
Bob
Carol
Dave
Erin
Frank
+2
Color 
8 red
' readStream.
	checker extractPlayerNumberDeclaration.
	checker extractPlayers.
	self deny: checker arePlayersValid 
]

{ #category : #'tests - actions' }
UnoCheckerTest >> testDraw [
	| checker |
	checker := UnoChecker new.
	checker actionLine: 'draw Bob'.
	
	self assert: checker currentAction name equals: 'draw'.
	self assert: checker currentAction player equals: 'Bob'.
]

{ #category : #'tests - actions' }
UnoCheckerTest >> testForcedDrawAction [
	| checker |
	checker := UnoChecker new.
	checker actionLine: '+2 blue Carol'.
	
	self assert: checker currentAction name equals: 'forced'.
	self assert: checker currentAction color equals: 'blue'.
	self assert: checker currentAction level equals: 2.
	self assert: checker currentAction player equals: 'Carol'.
]

{ #category : #'tests - actions' }
UnoCheckerTest >> testForcedDrawAction2 [
	| checker |
	checker := UnoChecker new.
	checker actionLine: '+4 blue Carol'.
	
	self assert: checker currentAction name equals: 'forced'.
	self assert: checker currentAction color equals: 'blue'.
	self assert: checker currentAction level equals: 4.
	self assert: checker currentAction player equals: 'Carol'.
]

{ #category : #'tests - actions' }
UnoCheckerTest >> testJokerAction [
	| checker |
	checker := UnoChecker new.
	checker actionLine: 'joker blue Frank'.
	
	self assert: checker currentAction name equals: 'joker'.
	self assert: checker currentAction color equals: 'blue'.
	self assert: checker currentAction player equals: 'Frank'.
]

{ #category : #'tests - player declaration' }
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

{ #category : #'tests - actions' }
UnoCheckerTest >> testNumberedAction [
	| checker |
	checker := UnoChecker new.
	checker actionLine: '5 red Alice'.
	
	self assert: checker currentAction name equals: 'numbered'.
	self assert: checker currentAction color equals: 'red'.
	self assert: checker currentAction player equals: 'Alice'.
]

{ #category : #'tests - player declaration' }
UnoCheckerTest >> testPlayerLineShouldBeANumberFollowedByPlayers [
	| checker |
	checker := UnoChecker new.
	self deny: (checker isPlayerNumberValid: 'aa 28').
	self deny: (checker isPlayerNumberValid: 'a1223z 28').
	self deny: (checker isPlayerNumberValid: '5 zozozoz').
	self deny: (checker isPlayerNumberValid: '6 tata players').
	self assert: (checker isPlayerNumberValid: '12 players')
]

{ #category : #'tests - player declaration' }
UnoCheckerTest >> testPlayers [
	| checker |
	checker := UnoChecker new stream: '6 players
Alice
Bob
Carol
Dave
Erin
Frank
7 red
' readStream.
	checker extractPlayerNumberDeclaration.
	checker extractPlayers.
	self
		assert: checker players asArray
		equals: #( 'Alice' 'Bob' 'Carol' 'Dave' 'Erin' 'Frank' )
]

{ #category : #'tests - actions' }
UnoCheckerTest >> testReverseAction [
	| checker |
	checker := UnoChecker new.
	checker actionLine: 'reverse blue Frank'.
	
	self assert: checker currentAction name equals: 'reverse'.
	self assert: checker currentAction color equals: 'blue'.
	self assert: checker currentAction player equals: 'Frank'.
]

{ #category : #'tests - actions' }
UnoCheckerTest >> testSkipAction [
	| checker |
	checker := UnoChecker new.
	checker actionLine: 'skip blue Frank'.
	
	self assert: checker currentAction name equals: 'skip'.
	self assert: checker currentAction color equals: 'blue'.
	self assert: checker currentAction player equals: 'Frank'.
]

{ #category : #'tests - player declaration' }
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
	checker extractPlayers.
	self deny: checker arePlayersValid 

]

{ #category : #'tests - player declaration' }
UnoCheckerTest >> testTooManyPlayers [
	| checker |
	checker := UnoChecker new stream: '3 players
Alice
Bob
Carol
Dave
6 red
' readStream.
	checker extractPlayerNumberDeclaration.
	checker extractPlayers.
	self deny: checker arePlayersValid 
]
