Rails.application.routes.draw do
  root 'application#top'
  resources :books
end
