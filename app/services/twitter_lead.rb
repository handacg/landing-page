require 'pry'
require 'rubocop'
require 'dotenv'
require 'twitter'
require 'json'

Dotenv.load

class TwitterLead

    def initialize
        puts "Bonjour"
        @client = Twitter::REST::Client.new do |config|
        # Utiliser DOTENV
            config.consumer_key        = ENV["TWITTER_API_KEY"]
            config.consumer_secret     = ENV["TWITTER_API_SECRET"]
            config.access_token        = ENV["ACCESS_TOKEN"]
            config.access_token_secret = ENV["ACCESS_TOKEN_SECRET"]        
        # Utiliser MASTER KEY
            # Rails.application.credentials.dig(:TWITTER_API_KEY)
            # Rails.application.credentials.dig(:TWITTER_API_SECRET)
            # Rails.application.credentials.dig(:TWITTER_ACCESS_TOKEN)
            # Rails.application.credentials.dig(:TWITTER_ACCESS_TOKEN_SECRET)
        end
        puts @client 
    end

    def namelead(string)
        # chercher les noms de mairies ou autre persona
        @name_lead = []
   
        Lead.where("persona = ?", string).each do |leadpersona| 
            puts leadpersona
            @name_lead << leadpersona.name
        end 
        print @name_lead
    end

    def followmessagelead(tab)
        # pour chaque nom, chercher "ville de le_nom_de_la_ville" sur twitter
        # recherche faite par morceaux de 15 noms et non tous d'affilée (règle twitter)
        tab.each do |valeur| 
            puts @client
            puts "bonjour3"
            @resultats_username = []
# =>> à adapter si autre cible
            @chaque_lead = @client.user_search("ville de #{valeur}") 
            @resultats_username << @chaque_lead

            puts @resultats_username
            i = 0
            # pour chaque section de résultats, follow et envoyer message
            @resultats_username.each do 
                first_result = @resultats_username[0].first # prendre le premier résultat des recherches (le plus accurate)
                puts "#{first_result} followed !"
                begin
                    # suivre ce handle
                    @client.follow(first_result) 
                    # tweeter un message avec le handle et un lien vers notre page
# =>> à adapter si autre cible
                    @client.update('Bonjour #{first_result}, intéressé pour organiser une formation gratuite au code dans votre ville ? C\'est possible : ')
                    sleep(5)
                rescue => error                
                end

                i += 1
                if i % 15 == 0
                    puts "Went to sleep for 15min"
                    sleep(900)
                end
            end
        end
    end

    # Pour lancer la fonction, rentrer nom du persona à twitter : mairie ou autre
    def perform(mytext)
        namelead(mytext)
        followmessagelead(@name_lead)
    end

end
