Rails.application.routes.draw do
  devise_for :users

  authenticate :user do
    resources :stagiaires do
      collection do
        get :en_cours
        get :termines
        get :new_en_cours
        post :create_en_cours
        get :new_termines
        post :create_termines
      end

      resources :internships, only: [:new, :create, :edit, :update, :destroy] do
        resources :to_documents, except: [:show] do
          member do
            patch 'archive'
          end
        end
      end
    end
  end

  root to: 'home#index'
  post 'newsletter_subscriptions', to: 'newsletter_subscriptions#create'

end
