class ScrapMairie

 attr_accessor :url971, :url972, :url974

    def initialize
        @url971 = "http://annuaire-des-mairies.com/guadeloupe.html"
        @url972 = "http://annuaire-des-mairies.com/martinique.html"
        @url974 = "http://annuaire-des-mairies.com/reunion.html"
        @urls = [url971, url972, url974]
    end

    def townhall_names(array)
        array.map do |url|
            doc = Nokogiri::HTML(open(url))
            doc.css("a.lientxt").map do |keys| 
            keys.text
            end
        end
    end

    def townhall_mails(array)
        array.map do |url|
            doc = Nokogiri::HTML(open(url))
            doc.css("a.lientxt/@href").map{|keys| keys.text}.map{|keys2| keys2.slice(1..-1)}.map{|url| "http://annuaire-des-mairies.com#{url}"}.map do |full_url| 
                begin
                doc = Nokogiri::HTML(open(full_url)) 
                doc.css('body > div > main > section:nth-child(2) > div > table > tbody > tr:nth-child(4) > td:nth-child(2)').text
                rescue
                end
            end
        end
    end

	def save(myhash)
		myhash.each do |k,v|
	        Lead.create!(name: k, email: v, persona: "mairie")
		end
	end

    def perform
    townhall_name = townhall_names(@urls).flatten
    townhall_emails = townhall_mails(@urls).flatten
    townhall_info = Hash[townhall_name.zip(townhall_emails)]
    save(townhall_info)
    return townhall_info
    end

end