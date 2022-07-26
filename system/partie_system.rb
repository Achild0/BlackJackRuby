def partieSolo(joueur)
    #Argument joueur doit etre de classe Profil
    puts "***Ouverture de la partie !!! Ca va etre du SOLO pour le moment !***"

    dealer = Dealer.new("Dealer")
    sjoueur = Joueur.new(joueur.getPseudo())
    players = Array.new

    players << sjoueur
    players << dealer
    

    puts "*** Distribution des cartes !!! ***"

    deck = Deck.new

    #Let's deal cards
    giveCards(players,deck)
    #Reveal dealt cards
    seeCards(players)
    players.each() do |p|
        if p.getPseud() != "Dealer"
            while p.canPlay
                manche(sjoueur,deck)
            end
        else
            p.play(deck)
        end
    end

    resultManche(players)

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

def manche(concerne,ledeck)
    puts "1 - Hit | 2 - Stand | 3 - Split (Not Done Yet) | 4 - Double (Not Ready Yet) | 5 - Abandon"
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

def giveCards(plys,deck)
    plys.each() do |p|
        2.times {        
            card = deck.draw
            p.donnerCarte(card)
            puts "Carte donnée a #{p.getPseud}"
        }
    end
end

def seeCards(plys)
    plys.each() do |p|
        print "Cartes de #{p.getPseud} : "
        puts p.voirCartes
    end
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

def resultManche(plys)
    dealer = plys.last
    plys.each() do |p|
        if p.getPseud != "Dealer" #TODO: Améliorer cela pour éviter de se baser sur le pseudo ...
            if p.getScoreActuel > 21 then
                puts "Vous avez perdu en dépassant 21, vous perdez votre mise"
            elsif dealer.getScoreActuel > 21 then
                puts "Vous remportez la partie ! Le croupier est au dessus de 21"
            else
                if dealer.getScoreActuel > p.getScoreActuel then
                    puts "Le croupier vous bat"
                elsif dealer.getScoreActuel == p.getScoreActuel then
                    puts "Egalité, vous récupérez votre mise"
                else
                    puts "Victoire bien méritée !!!"
                end
            end
        end
    end
end