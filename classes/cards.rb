#!/usr/bin/ruby -w

=begin Card Class

    The Card class represents a real card in a deck.
    int number = the cards value (11,12,13 are figures)
    int sign = 1: Heart 2: Carreau 3: Spades 4: Trèfle

=end
class Card
    def initialize(number,sign)
        @num,@sign = number,sign
        @visible = true
    end

    #Getters and setters

    attr_reader :sign
    attr_reader :num
    attr_accessor :visible

    #Methods

    #Gets the balckjack score of the card, and handels aces
    def getCardScore(actscore = 0)
        case @num
        when 1
            if actscore + 11 > 21 then
                return 1
            else
                return 11
            end
        when 11 .. 13
            return 10
        else
            return @num
        end
    end
end

=begin Deck Class

    The Deck class represents a real deck with cards in it (Card Class).
    The initialisation has no params

=end

class Deck
    #Class variables
    @@signes = 4
    @@nombres_cartes = 52

    #Constructor - Will create a 52 cards deck.
    def initialize
        @n_cartes = 0
        @cartes = Array.new
        _compt = 1
        while _compt <= 4 do
            for i in 1..(@@nombres_cartes / @@signes)
                @cartes << Card.new(i,_compt)
                @n_cartes +=1
            end
            _compt +=1
        end
        @cartes = @cartes.shuffle
    end

    #Getters and setters

    attr_reader :n_cartes

    #Methods

    #draw method simply get a card
    def draw
        @n_cartes -=1
        return @cartes.shift
    end
end