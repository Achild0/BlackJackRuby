#!/usr/bin/ruby -w
#Require part
require 'json' # Love you json <3

#Constant part

=begin Profile Class

    The Profile class is the profile of the player, you got everything here.
    Your stats money and identity.
    string pseud => Your alias
    float amount  => Your money
    int victories => Self expl.
    int defeats => Self expl.
    float Loan  => Still in building phase #TODO Make this loan a class for more fun (intersests and stuffs)
=end
class Profile
    def initialize(pseud,amount = 0,victories = 0,defeats = 0,loans = {},fame = 0)
        @pseudo = pseud
        @amount = amount
        @victories = victories
        @defeats = defeats
        @loans = loans
        @fame = fame
    end

    #saveSelf() -> Save profile in json locally
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

    #loadFromFile(FileName) -> Remold a profile from existing save file
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
            @loans = profile_parsed["loans"]
            @fame = profile_parsed["fame"]
            aFile.close
            return self
        end
    end

    #toVisual -> Print stats in console
    def toVisual()
        puts "------------------------"
        puts "- Pseudo: #{@pseudo}"
        puts "- Amount: #{@amount}"
        puts "- Victories : #{@victories}"
        puts "- Defeats: #{@defeats}"
        puts "- Loan: #{@loans}"
        puts "------------------------"
    end

    def generateJsonString()
        profile_json = {
            :pseudo => @pseudo,
            :amount => @amount,
            :victories => @victories,
            :defeats => @defeats,
            :loans => @loans,
            :fame => @fame
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
        @loans
    end

    def addLoan(loaner,amt)
        @loans[loaner.id] += amt
    end

    def getFame()
        @fame
    end

    def addFame(amt)
        @Fame += amt
    end
end