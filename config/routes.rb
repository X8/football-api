Rails.application.routes.draw do
  namespace :api, defaults: { format: 'json' } do
    resources :leagues, only: [:index, :show] do
      resources :fixtures, only: [:index, :show] do
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
