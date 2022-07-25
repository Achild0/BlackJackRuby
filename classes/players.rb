#!/usr/bin/ruby -w

=begin Joueur Class
    The Joueur Class represents the player as a BlackJack entity. 
    string pseudo -> The alias
=end
class Joueur
    

    def initialize(pseudo = "Connard")
        @pseudo = pseudo
        @cartes = Array.new
        @scoreAct = 0
        @canPlay = true
<<<<<<< HEAD
        @assProfile = nil
=======
        @connexion = nil
>>>>>>> e3b4de9 (Ajout interaction avec Multiple conneixon + réponse + profil temp.)
    end

    def donnerCarte(carte)
        @cartes << carte
        @scoreAct += carte.getCardScore(@scoreAct)
    end

    attr_accessor :connexion

    def getScoreActuel
        new_score = 0
        @cartes.each do |i|
           new_score += i.getCardScore(@scoreAct)
        end
        @scoreAct = new_score
        return @scoreAct
    end

    def getPseud
        @pseudo
    end

    def getCards
        @cartes
    end

    def voirCartes
        @i_g = ""
        if @cartes.size == 0
            @i_g = "Aucune Carte"
        else
            @cartes.each do |i|
                if i.visible then
                    case i.num
                    when 2..10
                        @i_g += "|#{i.num} de "
                    when 1 
                        @i_g += "|As de "
                    when 11
                        @i_g += "|Valet de "
                    when 12
                        @i_g += "|Reine de "
                    when 13
                        @i_g += "|Roi de "
                    else
                        @i_g += "|**ERREUR** "
                    end

                    case i.sign
                    when 1
                        @i_g += "Coeur|"
                    when 2
                        @i_g += "Carreau|"
                    when 3 
                        @i_g += "Pique|"
                    when 4
                        @i_g += "Trèfle|"
                    else
                        @i_g += " **ERREUR**|"
                    end
                else
                    @i_g += "|XXXXXXXXXXX|" #Carte cachée pour le croupier
                end
            end
        end
        return @i_g
    end

    def canPlay
        @canPlay
    end

    def playStatus(pl)
        @canPlay = pl
    end

    def getType()
        @@type
    end

    def getProfle()
        @assProfile
    end

    def setProfile(prof)
        @assProfile = prof
    end
end

=begin Dealer Class - Inherits Joueur
    The Joueur Class represents the player as a BlackJack entity. 
    string pseudo -> The alias
    Dealer class is juste a player class for npc
=end
class Dealer < Joueur

    def play(deck)
        @cartes.each do |c| 
            c.visible = true
        end
        while @scoreAct < 17
            puts "Le croupier prend une carte ..."
            self.donnerCarte(deck.draw)
        end

        puts self.voirCartes
    end

    def donnerCarte(carte)
        if @cartes.size == 1 then
            carte.visible = false
        end
        @cartes << carte
        @scoreAct += carte.getCardScore(@scoreAct)
    end

end