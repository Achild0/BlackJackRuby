require 'json'
require_relative 'system/save_system'

def soloGame
    #Variables importantes pour la suite de la partie.
    solo_ActPlayer = nil

    begin
        solo_ActPlayer = loadSaves()
    rescue => exception 
        puts "DEBUG: Ca va chier #{exception.message}" #DEBUG A delete
        return false
    end

    puts "DEBUG: SoloactPLayer => #{solo_ActPlayer.to_s}" #DEBUG
    
    while testSoloPartie(solo_ActPlayer) do
    end
    return false
end
