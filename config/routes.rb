Rails.application.routes.draw do
  root 'subscriptions#new'

  resource 'subscriptions'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
