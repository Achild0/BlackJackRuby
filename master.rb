#!/usr/bin/ruby -w
BEGIN {

#Constants / Global Vars
Subprocess_to_end = Array.new

#Require
require 'securerandom'

#require_relative
require_relative 'classes/cards.rb'
require_relative 'classes/players.rb'
require_relative 'classes/profile.rb'
require_relative 'system/partie_system'
require_relative 'system/save_system'
#require_relative 'system/multiplayer_system'
require_relative 'solo.rb'

#Welcome text and menu

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
    puts "Even if you're lonely, we'll play with you."
    mn_thread = Thread.new{soloGame()}
    mn_thread.join
when 5
    puts "Vous aller quitter le programe ! En êtes-vous sûr ?\n Appuyez sur 5 encore une fois pour confirmer."
    if gets.chomp.to_i == 5
        return
    end
when 2
    puts "On heberge alors !"
    system("clear") || system("cls")
    sv_thread = Thread.new{hostGame()}
    puts "DEBUG: Thread serveur lancé" #DEBUG
    Subprocess_to_end << sv_thread
else
    puts "DEBUG: Feature non disponible pour le moment."  #DEBUG
end

END {
    Subprocess_to_end.each {|t| t.join}
    puts "Press enter to close ..."
    gets #DEBUG Make juste to wait. Finally to delete
};