class Mailchimp

	def initialize
		@gibbon = Gibbon::Request.new
	end

	def retrieve
		@gibbon.lists.retrieve
	end


	def create_campaign
		recipients = {
			list_id: '513a1c8a9f'
			}
		settings = {
		  subject_line: "Subject Line",
		  title: "Name of Campaign",
		  from_name: "From Charles Dacquay",
		  reply_to: "thehackingproject.s6@gmail.com"
		}

		body = {
		  type: "regular",
		  recipients: recipients,
		  settings: settings,
		  template: { id:44001}
		}

		begin
			@gibbon.campaigns.create(body: body)
		rescue Gibbon::MailChimpError => e
		  puts "Houston, we have a problem: #{e.message} - #{e.raw_body}"
		end
	end

	def send_campaign
		@gibbon.campaigns(e1712f9708).actions.send.create
	end

end