class LandingController < ApplicationController
	def create
		puts @new_subscriber
		email = params["email"]
		type = params['type']
		Mailing.new.new_subscriber(email,type)
		redirect_to root_path
	end

	def new
		@new_subscriber = Subscriber.new
		@people = params[:people]
		@index = ['designers','students','cities'].index(@people)
	end

	def show
	end
end
