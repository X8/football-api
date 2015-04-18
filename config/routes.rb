Rails.application.routes.draw do
  root to: 'home#index'
  namespace :api, defaults: { format: 'json' } do
    resources :leagues, only: [:index, :show] do
      resources :fixtures, only: [:index, :show] do
        collection do
          get "gameweek/:gameweek", action: "gameweek"
        end
        resources :touch_events, only: [:index]
        resources :events, only: [:index, :show] do
          collection do
            get :start
          end
        end
      end
      resources :rosters, only: [:index, :show]
    end

    resources :event_codes
  end
end
