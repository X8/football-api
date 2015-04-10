Rails.application.routes.draw do
  namespace :api, defaults: { format: 'json' } do
    resources :leagues, only: [:index, :show] do
      resources :fixtures, only: :index
      resources :rosters, only: [:index, :show]
    end

    resources :event_codes
  end
end
