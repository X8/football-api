Rails.application.routes.draw do
  namespace :api, defaults: { format: 'json' } do
    resources :leagues, only: [:index, :show]
  end
end
