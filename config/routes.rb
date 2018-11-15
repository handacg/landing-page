Rails.application.routes.draw do
	get '/', to: 'landing#new', as: 'root'
	post '/', to: 'landing#create'
end
