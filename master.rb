#!/usr/bin/ruby -w
BEGIN {

require_relative 'cards.rb'
require_relative 'entites.rb'
require_relative 'partie.rb'
require_relative 'system/profile_system'
require_relative 'system/save_system'
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
puts "4 - TO DO LIST"
puts "5 - Crédits"
puts "6 - Quitter"

};

menu_choix = gets.chomp.to_i
case menu_choix
when 1
    puts "Choix du soloiste !"
    mn_thread = Thread.new{soloGame()}
    puts "DEBUG: Thread Lancé" #DEBUG
    mn_thread.join
else
    puts "DEBUG: feature non disponible pour le moment."  #DEBUG
end

END {
    puts "Press enter to close ..."
    gets #DEBUG Make juste to wait. Finally to delete
};