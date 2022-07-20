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

    def setVisible(bool)
        @visible = bool
    end

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

    def getCardSign()
        return @sign
    end

    def getNum()
        return @num
    end

    def getVisible()
        return @visible
    end
end

class Deck
    @@signes = 4
    @@nombres_cartes = 52
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

    def draw
        @n_cartes -=1
        return @cartes.shift
    end

    def getNbCards
        return @n_cartes
    end
end