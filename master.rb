#!/usr/bin/ruby -w
BEGIN {

require_relative 'classes/cards.rb'
require_relative 'classes/players.rb'
require_relative 'classes/profile.rb'
require_relative 'system/partie_system'
require_relative 'system/save_system'
#require_relative 'system/multiplayer_system'
require_relative 'solo.rb'

puts "======================================"
puts "Bienvenue au RubyJack Games !"
puts "On commence bientôt les amis :)"
puts "======================================"
puts "\n"
puts "Menu Principal : "
puts "1 - Lancer une partie Solo"
puts "2 - Héberger un salon Multijoueur"
puts "3 - Rejoindre un salon Multijoueur"
puts "4 - Crédits"
puts "5 - Quitter"

};

menu_choix = gets.chomp.to_i
case menu_choix
when 1
    puts "Choix du soloiste !"
    mn_thread = Thread.new{soloGame()}
    mn_thread.join
when 5
    puts "Vous aller quitter le programe ! En êtes-vous sûr ?\n Appuyez sur 5 encore une fois pour confirmer."
    if gets.chomp.to_i == 5
        return
    end
else
    puts "DEBUG: feature non disponible pour le moment."  #DEBUG
end

END {
    puts "Press enter to close ..."
    gets #DEBUG Make juste to wait. Finally to delete
};