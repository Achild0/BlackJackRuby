require 'socket'
require "json/add/Joueur"
require "json/add/Carte"

def hostGame()

    server = TCPServer.open(2000)
    puts server.addr(true)

    joueurs = Array.new
    timer = 30
    timer_counter = 0
    timer_thread = Thread.new {
        while timer_counter != timer 
            sleep(1)
            timer_counter += 1
            puts timer_counter
        end
    }

    connexion_thread = Thread.new {
        loop {
            Thread.start(server.accept) do |client|
                client.puts "Connexion Successfull"
                client.puts "DEBUG : Please send me the data i need to create your multi-profile" #DEBUG
                client.puts "PROFILE_DATA"
                response = client.gets.chop
                puts "DEBUG: Response #{response}" #DEBUG
                puts "DEBUG: Received DATA" #DEBUG
                client.puts "Ok, it was fun. Creating your online profile"
                participant = Joueur.new(response)
                participant.connexion = client
                joueurs << participant
                client.puts "You're in the game"
            end
        }
    }

    timer_thread.join()
    puts "Let us start the game !"
    joueurs.each() do |j|
        j.connexion.puts "La partie commence !"
    end
end

def clientGame()
    hostname = 'localhost'
    port = 2000
    me = nil

    begin
        s = TCPSocket.open(hostname, port)
    rescue Exception => e
        puts e.to_s
        puts "DEBUG : Error on connexion, sleeping 5 sec rety" #DEBUG
        sleep(5)
        retry
    end

    while line = s.gets
        puts line.chop
        case line.chop
        when "PROFILE_DATA"
            r = gets.chomp
            s.puts r
            me = Joueur.new(r)
        when "PLAY"
            puts "1 - Hit, 2 - Stand, 3 - Fold"
            s.puts gets.chomp
        when "CARD"
            puts "Carte recue"
            me.donnerCarte (JSON.parse(s.gets ))
        end   
    end
    s.close
end

def searchProfile()

end 