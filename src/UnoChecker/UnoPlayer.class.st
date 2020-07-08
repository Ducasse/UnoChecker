Class {
	#name : #UnoPlayer,
	#superclass : #Object,
	#instVars : [
		'cardCount',
		'name'
	],
	#category : #UnoChecker
}

{ #category : #accessing }
UnoPlayer >> cardCount [
	^ cardCount
]

{ #category : #accessing }
UnoPlayer >> cardCount: anObject [
	cardCount := anObject
]

{ #category : #'as yet unclassified' }
UnoPlayer >> drawsACard [
	cardCount := cardCount + 1
]

{ #category : #initialization }
UnoPlayer >> initialize [ 	
	super initialize.
	self cardCount: 7
]

{ #category : #accessing }
UnoPlayer >> name [
	^ name
]

{ #category : #accessing }
UnoPlayer >> name: anObject [
	name := anObject
]

{ #category : #'as yet unclassified' }
UnoPlayer >> playACard [
	cardCount := cardCount -1 
]
