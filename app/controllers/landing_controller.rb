class LandingController < ApplicationController
	def create
		email = params["email"]
		category = params['category']
		Subscriber.create(email: email, category: category)
		Mailing.new.new_subscriber(email,category)
		redirect_back(fallback_location: root_path)
	end

	def new
		@new_subscriber = Subscriber.new
		@categories = ['designers','students','cities']
		@people = params[:people]

		if @categories.index(@people) == nil
			redirect_to "/students"
		else
		end
	end

end
