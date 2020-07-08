Class {
	#name : #UnoAction,
	#superclass : #Object,
	#instVars : [
		'color',
		'player'
	],
	#category : #UnoChecker
}

{ #category : #testing }
UnoAction class >> canDigest: aString [
	^ false
]

{ #category : #testing }
UnoAction class >> newFrom: aSplit [

	^ self new fromSplitString: aSplit
]

{ #category : #'as yet unclassified' }
UnoAction >> color [
	^ color
]

{ #category : #accessing }
UnoAction >> name [ 
	
	^ 'zork'
]
