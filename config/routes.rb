Rails.application.routes.draw do
  devise_for :users
  root to: 'home#index'

  resources :users do
    collection do
      get 'me'
    end
  end

  resources :companies, except: :destroy

  resources :surveys do
    collection do
      post 'create_or_update'
      get 'gnrl_format'
      get 'answer_scale'
      get 'demo_quest'
      get 'proficiencies'
      get 'questionnaire'
      get 'participants'
      get 'evaluators'
      get ':token/responses/new', to: 'responses#new', as: :new_response
    end
    member do
      get 'section1'
      get 'section2'
      get 'section3'
      get 'confirmation'
    end
    resources :responses, only: [:index, :show, :new, :create]
  end
  get 'responses/all', to: 'responses#general'

  devise_scope :user do
    authenticated :user do
      root 'companies#index', as: :authenticated_root
    end

    unauthenticated do
      root 'home#index', as: :unauthenticated_root
    end
  end
end
