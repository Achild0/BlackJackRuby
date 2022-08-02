#!/usr/bin/ruby -w

class MoneyLoaner
    def initialize(id = 0,moneyLimit,minFame)
        lNameFile = IO.readlines("system/data/last_names.txt")
        fNameFile = IO.readlines("system/data/first_names.txt")
        lNameFile = lNameFile.shuffle()
        fNameFile = fNameFile.shuffle()
        @id = id
        @firstName = fNameFile[0]
        @lastName = lNameFile[0]
        @playerMoneyGiven = 0
        @moneyLimit = moneyLimit
        @minFame = minFame
    end

    attr_reader :id

    def askLoan(amt,fame)
        if @minFame > fame then
            puts "T'es qui toi putain ?"
            return 0
        end
        if @playerMoneyGiven + amt > @moneyLimit then
            puts "Navré, vous dépassez les bornes"
            return 0
        end
        @playerMoneyGiven += amt
        puts "Tsss, tiens. Gâche pas tout !"
        return amt
    end

    def rembourseLoan(amt)
        if amt > @playerMoneyGiven then
            puts "Pas besoin d'autant de thune, je te rend le reste"
            reste = amt - @playerMoneyGiven
            @playerMoneyGiven = 0
            return reste
        else
            puts "Continue comme ca"
            @playerMoneyGiven -= amt
            return 0
        end
    end

    def getContact()
        puts "**************"
        puts "ID : #{@id}"
        puts "Nom : #{@lastName}"
        puts "Prénom : #{@firstName}"
        puts "A déja prêté : #{@playerMoneyGiven} sur sa limite de #{@moneyLimit}"
        puts "Te donneras rien si t'es pas un minimum de fame : #{@minFame}"
        puts "**************"
    end


end

=begin
Permet de générer les prêteurs sur gages.
=end

def generateLoaners(amt,minMoney,maxMoney,minFame,maxFame)
    loaners = Array.new()
    loaners << MoneyLoaner.new(1,rand(5000..10000),rand(0..5))
    for i in 2..amt - 1 
        loaners << MoneyLoaner.new(i,rand(minMoney..maxMoney),rand(minFame..maxFame))
    end
    loaners << MoneyLoaner.new(amt,rand(5000000..10000000),rand(200..350))
    puts "DEBUG: Loaners : #{loaners}" #DEBUG
    return loaners
end