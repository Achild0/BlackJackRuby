#!/usr/bin/ruby -w
BEGIN {
    require_relative 'classes/cards.rb'
    require_relative 'classes/players.rb'
    require_relative 'classes/profile.rb'
    require_relative 'system/partie_system.rb'
    #require_relative 'system/multiplayer_system'
    require_relative 'system/save_system'
    require_relative 'system/money_system'
    require_relative 'solo.rb'
}

puts "DEBUG: TEST COMMANCE" #DEBUG Tout ce fichier est un DEBUG


loaners = generateLoaners(7,5000,5000000,5,150)

loaners.each() do |l|
    l.getContact()
end


=begin
loaner = MoneyLoaner.new(50000,10)
loaner.getContact()
loaner.askLoan(5000,10)
loaner.getContact()
loaner.askLoan(44000,20)
loaner.getContact()
loaner.askLoan(1000,5)
loaner.getContact()
loaner.askLoan(1000,150)
loaner.getContact()
loaner.rembourseLoan(15000)
loaner.getContact()
=end

   
END {
    puts "END OF TEST Press enter to close ..."
    gets #Eaiting a bit
};
