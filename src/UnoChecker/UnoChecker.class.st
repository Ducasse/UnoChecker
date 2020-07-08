Class {
	#name : #UnoChecker,
	#superclass : #Object,
	#instVars : [
		'stream'
	],
	#category : #UnoChecker
}

{ #category : #'as yet unclassified' }
UnoChecker >> numberOfPlayers [
	
	| numberString |
	numberString := stream upTo: Character space.
	^ numberString asNumber
]

{ #category : #'as yet unclassified' }
UnoChecker >> stream: aReadStream [ 
	stream := aReadStream
]
