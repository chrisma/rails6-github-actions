Rails.application.routes.draw do
  get 'welcome/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # https://guides.rubyonrails.org/getting_started.html#getting-up-and-running
  resources :articles do
    # https://guides.rubyonrails.org/getting_started.html#adding-a-route-for-comments
    resources :comments
  end

  # https://guides.rubyonrails.org/getting_started.html#setting-the-application-home-page
  root 'welcome#index'
end
