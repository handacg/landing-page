require 'pry'
require 'rubocop'
require 'dotenv'
require 'twitter'
require 'json'

Dotenv.load

class TwitterLead

    def initialize
        
        client = Twitter::REST::Client.new do |config|
        # Utiliser MASTER KEY
            Rails.application.credentials.dig(:TWITTER_API_KEY)
            Rails.application.credentials.dig(:TWITTER_API_SECRET)
            Rails.application.credentials.dig(:TWITTER_ACCESS_TOKEN)
            Rails.application.credentials.dig(:TWITTER_ACCESS_TOKEN_SECRET)
        end
    end

    def namelead(string)
        # chercher les noms de mairies ou autre persona
        Lead.where("persona = #{string}") do |leadpersona| 
            name_lead = []
            name_lead << leadpersona.name
        end 
    end

    def followmessagelead(tab)
        # pour chaque nom, chercher "ville de le_nom_de_la_ville" sur twitter
        # recherche faite par morceaux de 15 noms et non tous d'affilée (règle twitter)
        tab.each do |valeur| 

            @resultats_username = []
# =>> à adapter si autre cible
            @chaque_lead = client.user_search("ville de #{valeur}") 
            @resultats_username << @chaque_lead

            i = 0
            # pour chaque section de résultats, follow et envoyer message
            @resultats_username.each do 
                first_result = @resultats_username[0].first # prendre le premier résultat des recherches (le plus accurate)
                puts "#{first_result} followed !"
                begin
                    # suivre ce handle
                    client.follow(first_result) 
                    # tweeter un message avec le handle et un lien vers notre page
# =>> à adapter si autre cible
                    client.update('Bonjour #{first_result}, intéressé pour organiser une formation gratuite au code dans votre ville ? C\'est possible : ')
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
    def perform(string)
        name_lead = namelead(string)
        followmessagelead(name_lead)
    end

end
