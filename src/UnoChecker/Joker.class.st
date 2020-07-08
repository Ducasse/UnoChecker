Class {
	#name : #Joker,
	#superclass : #UnoAction,
	#category : #UnoChecker
}

{ #category : #testing }
Joker class >> canDigest: aSplit [

	^ aSplit first = 'joker'
]

{ #category : #'instance creation' }
Joker >> fromSplitString: aCollection [ 
	
	color := aCollection second.
	player := aCollection third
	
]

{ #category : #accessing }
Joker >> name [ 
	^ 'joker'
]

{ #category : #accessing }
Joker >> player [
	^ player
]
