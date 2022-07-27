require 'json'
require_relative 'system/save_system'

def soloGame
    #Variables importantes pour la suite de la partie.
    solo_ActPlayer = nil

    begin
        solo_ActPlayer = loadSaves()
    rescue => exception 
        puts "DEBUG: Erreur dans les suavegardes #{exception.message}" #DEBUG A delete
        puts exception.backtrace
        return false
    end

    puts "DEBUG: SoloactPLayer => #{solo_ActPlayer.to_s}" #DEBUG
    
    while testSoloPartie(solo_ActPlayer) do
    end
    return false
end
