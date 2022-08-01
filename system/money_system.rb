#!/usr/bin/ruby -w

class MoneyLoaner
    def initialize(moneyLimit,minFame)
        lNameFile = IO.readlines("system/data/last_names.txt")
        fNameFile = IO.readlines("system/data/first_names.txt")
        lNameFile = lNameFile.shuffle()
        fNameFile = fNameFile.shuffle()

        @firstName = fNameFile[0]
        @lastName = lNameFile[0]
        @playerMoneyGiven = 0
        @moneyLimit = moneyLimit
        @minFame = minFame
    end

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
        puts "Nom : #{@lastName}"
        puts "Prénom : #{@firstName}"
        puts "A déja prêté : #{@playerMoneyGiven} sur sa limite de #{@moneyLimit}"
        puts "Te donneras rien si t'es pas un minimum recoonu : #{@minFame}"
        puts "**************"
    end




end