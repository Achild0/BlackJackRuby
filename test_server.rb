#!/usr/bin/ruby -w
BEGIN {
    require_relative 'classes/cards.rb'
    require_relative 'classes/players.rb'
    require_relative 'classes/profile.rb'
    require_relative 'system/partie_system.rb'
    require_relative 'system/multiplayer_system'
    require_relative 'system/save_system'
    require_relative 'solo.rb'
}

    hst = Thread.new{hostGame()}
    hst.join
    

END {
    puts "END OF TEST Press enter to close ..."
    gets #Eaiting a bit
};
