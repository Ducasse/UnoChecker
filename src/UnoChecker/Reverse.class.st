Class {
	#name : #Reverse,
	#superclass : #UnoAction,
	#category : #UnoChecker
}

{ #category : #testing }
Reverse class >> canDigest: aSplitLine [
	
	^ aSplitLine first = 'reverse'

	
]

{ #category : #'instance creation' }
Reverse >> fromSplitString: aCollection [ 
	
	color := aCollection second.
	player := aCollection third
	
]

{ #category : #'instance creation' }
Reverse >> name [ 
	^ 'reverse'
]

{ #category : #'instance creation' }
Reverse >> player [

	^ player
]
