require 'json'
require_relative 'system/save_system'

def soloProfile
    #Variables importantes pour la suite de la partie.
    solo_ActPlayer = nil
    checkSave()
    
    begin
        solo_ActPlayer = loadProfile()
    rescue => exception 
        puts "DEBUG: Erreur dans les sauvegardes #{exception.message}" #DEBUG A delete
        puts exception.backtrace
        return false
    end
 
    while soloMainMenu(solo_ActPlayer) do
    end
    return false
end

def soloGame

end


def soloMainMenu(profile)
    #MENU du SOLO
    puts "**********"
    puts "*  SOLO  *"
    puts "**********"
    
    puts "1 - Jouer une partie"
    puts "2 - Voir les stats"
    puts "3 - Gérer vos fonds"
    puts "4 - Retour au menu principal\n"

    soloChoice = gets.chomp.to_i
    
    case soloChoice
    when 1
        while partieSolo(solo_ActPlayer) do
        end
        return true
    when 2 
        solo_ActPlayer.toVisual()
        return true
    when 3
        puts "DEBUG: Pas encore implémenté" #DEBUG 
        return false
    when 4
        return false
    else
        return false
    end

end