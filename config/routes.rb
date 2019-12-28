Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'pages#show', page: 'welcome'
  get  'pages/:page', to: 'pages#show', as: 'pages'
end
