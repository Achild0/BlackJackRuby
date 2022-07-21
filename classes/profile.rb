#!/usr/bin/ruby -w
require 'json'

class Profile
    def initialize(pseud,amount = 0,victories = 0,defeats = 0,loan = 0)
        @pseudo = pseud
        @amount = amount
        @victories = victories
        @defeats = defeats
        @loan = loan
    end

    def saveSelf()
        profile_json = generateJsonString()
        aFile = File.new("sauvgard/#{@pseudo}.json", "w")
        unless aFile then
            puts "ERROR : Fichier introuvable/créable"
            return
        else   
            aFile.syswrite(profile_json)
            puts "DEBUG: Profile saved"
            aFile.close
            return
        end
    end

    def loadFromFile(file)
        aFile = File.new("#{file}","r")
        unless aFile
            puts "ERROR: Fichier non trouvé"
            return
        else
            profile_parsed = JSON.parse(aFile.readline)
           #puts "DEBUG : #{profile_parsed.to_s}" #DEBUG
            @pseudo = profile_parsed["pseudo"]
            @amount = profile_parsed["amount"]
            @victories = profile_parsed["victories"]
            @defeats = profile_parsed["defeats"]
            @loan = profile_parsed["loan"]
            aFile.close
            return self
        end
    end

    def toVisual()
        puts "------------------------"
        puts "- Pseudo: #{@pseudo}"
        puts "- Amount: #{@amount}"
        puts "- Victories : #{@victories}"
        puts "- Defeats: #{@defeats}"
        puts "- Loan: #{@loan}"
        puts "------------------------"
    end

    def generateJsonString()
        profile_json = {
            :pseudo => @pseudo,
            :amount => @amount,
            :victories => @victories,
            :defeats => @defeats,
            :loan => @loan
    }.to_json
        puts "DEBUG : JsonProfile = #{profile_json}"
        return profile_json
    end

    def getPseudo()
        @pseudo
    end

    def getAmount()
        @amount
    end

    def addAmount(amt)
        @amount += amt
    end

    def getVictories()
        @victories
    end

    def addVictory()
        @victories += 1
    end

    def getDefeat()
        @defeats
    end

    def addDefeat()
        @defeats += 1
    end

    def getLoan()
        @loan
    end

    def addLoan(amt)
        @Loan += amt
    end
end