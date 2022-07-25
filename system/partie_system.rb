def testSoloPartie(joueur)
    #Argument joueur doit etre de classe Profil
    puts "***Ouverture de la partie !!! Ca va etre du SOLO pour le moment !***"

    dealer = Dealer.new("Dealer")
    sjoueur = Joueur.new(joueur.getPseudo())

    puts "*** Distribution des cartes !!! ***"

    deck = Deck.new

    2.times {
        sjoueur.donnerCarte(deck.draw)
        puts "Carte donnée a #{sjoueur.getPseud}"
        dealer.donnerCarte(deck.draw)
        puts "Carte donnée a #{dealer.getPseud}"
    }

    print "Tes cartes de joueur : "
    puts sjoueur.voirCartes

    print "Cartes du dealer : "
    puts dealer.voirCartes

    while sjoueur.canPlay
        manche(sjoueur,deck)
    end
    dealer.play(deck)

    if sjoueur.getScoreActuel > 21 then
        puts "Vous avez perdu en dépassant 21, vous perdez votre mise"
    elsif dealer.getScoreActuel > 21 then
        puts "Vous remportez la partie ! Le croupier est au dessus de 21"
    else
        if dealer.getScoreActuel > sjoueur.getScoreActuel then
            puts "Le croupier vous bat"
        elsif dealer.getScoreActuel == sjoueur.getScoreActuel then
            puts "Egalité, vous récupérez votre mise"
        else
            puts "Victoire bien méritée !!!"
        end
    end

    puts "Encore une partie ? (O/N)"
    encore_une = gets.chomp
    case encore_une
    when 'O'
        return true
    when 'N'
        return false
    else
        return false
    end
end

def partiMulti(joueurs) #TODO partieMulti

end

def manche(concerne,ledeck)
    puts "1 - Hit | 2 - Stand | 3 - Split (Not Done Yet) | 4 - Double 8Not Ready Yet | 5 - Abandon"
    case gets.strip
    when "1"
        caseHit(concerne,ledeck)
    when "2"
        caseStand(concerne,ledeck)
    when "5"
        caseAbondon(concerne,ledeck)
    else
        puts "Try again"
        manche(concerne,ledeck)
        return
    end
    
    puts concerne.voirCartes
end

def caseHit(ply,deck)
    puts "Hit est choisi ! On disitribue"
    ply.donnerCarte(deck.draw)
    case ply.getScoreActuel
    when 21
        puts "BlackJack"
        ply.playStatus(false)
    when 21 .. 100
        puts "Vous avez dépassé"
        ply.playStatus(false)
    else
        ply.playStatus(true)
    end
end

def caseStand(ply,deck)
    puts "You stand ! Can't play anymore !"
    ply.playStatus(false)
end

def caseAbondon(ply,deck)
    puts "You have abandonned! Can't play anymore !"
    ply.playStatus(false)
end