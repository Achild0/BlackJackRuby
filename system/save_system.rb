def loadSaves
    totalEntries = 0
    saves = Array.new
    solo_ActPlayer = nil #Class Profile

    Dir.entries("sauvgard").each do |f|
        if f != "." && f != ".." then
            totalEntries += 1
            saves << f
        end
    end
    
    if totalEntries == 0 then
        puts "Aucune sauvegarde existante"
        solo_ActPlayer = newProfile()
        return solo_ActPlayer
    else
        puts "Choisissez un profil : "
        puts "DEBUG: #{saves.to_s}" #DEBUG
        for i in 0..saves.size - 1
           puts "#{i} - #{saves[i]}" 
        end
        puts "ou créer un nouveau (N)?"
        cs = gets.chomp # FIXME: A sécuriser ca 
        temp_prof = Profile.new("Dude")
        if cs == 'N' then
            solo_ActPlayer = newProfile()
            return solo_ActPlayer
        else
            temp_prof.loadFromFile("sauvgard/#{saves[cs]}")
            solo_ActPlayer = temp_prof
            temp_prof = nil
            puts "Profil chargé : #{solo_ActPlayer.getPseudo()}"
            return solo_ActPlayer
        end
    end
end

def newProfile
    puts "Créer un nouveau profil ? (O/N)"
    pc = gets.chomp
    case pc
    when "O"
        puts "Entrez votre pseudo ?" #TODO: Sécuriser tout ca 
        profileName = gets.chomp
        solo_ActPlayer = Profile.new(profileName)
        solo_ActPlayer.saveSelf()
        puts "Profil crée : #{solo_ActPlayer.getPseudo()}"
        return solo_ActPlayer
    when "N"
        puts "Retour au menu ..."
        raise("DEBUG: Ne veut pas creer de profil alors PROUT !!!") #FIXME Faire ca mieux
    else
        puts "ERROR: Mauvais res, c'est naze"
        raise("ERREUR lors de la saisie") #FIXME Faire ca mieux
    end
end