class LandingController < ApplicationController
	def create
		email = params["EMAIL"]
		Mailing.new.new_subscriber(email)
		redirect_to root_path
	end

	def new
		@new_subscriber = Subscriber.new
	end

	def show
	end
end
