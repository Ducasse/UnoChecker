Class {
	#name : #Draw,
	#superclass : #UnoAction,
	#category : #UnoChecker
}

{ #category : #testing }
Draw class >> canDigest: aSplit [

	^ aSplit first = 'draw'
]

{ #category : #'instance creation' }
Draw >> fromSplitString: aCollection [ 
	
	player := aCollection second
	
]

{ #category : #'instance creation' }
Draw >> name [ 
	^ 'draw'
]

{ #category : #'instance creation' }
Draw >> player [
	^ player
]
