Rails.application.routes.draw do
  get root :to => 'books#top'
  get 'books' => 'books#index'
  get 'books/:id' => 'books#show'
  get 'books/:id/edit' => 'books#edit'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
