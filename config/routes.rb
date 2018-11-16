Rails.application.routes.draw do
	get '/', to: 'landing#new', as: 'root'
	post '/', to: 'landing#create'
	get '/:people', to: 'landing#new'
end
