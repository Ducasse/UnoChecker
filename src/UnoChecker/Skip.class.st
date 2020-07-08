Class {
	#name : #Skip,
	#superclass : #UnoAction,
	#category : #UnoChecker
}

{ #category : #testing }
Skip class >> canDigest: aSplitLine [

	^ aSplitLine first = 'skip'

	
]

{ #category : #'instance creation' }
Skip >> fromSplitString: aCollection [ 
	
	color := aCollection second.
	player := aCollection third
	
]

{ #category : #accessing }
Skip >> name [ 	

	^ 'skip'
]

{ #category : #'as yet unclassified' }
Skip >> player [
	^ player
]
