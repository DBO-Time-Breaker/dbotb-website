Rails.application.routes.draw do
  scope module: :web do
    scope module: :public do
      # Home
      get '/', to: "home#index", as: :root
      post "register", to: "home#account_register", as: :account_register
      
      # Accounts
      get "login", to: "accounts#index", as: :account_login
      post "login", to: "accounts#login_submit", as: :account_login_submit
      get "logout", to: "accounts#logout_submit", as: :account_logout

      # Ranking
      get "ranking/players", to: "ranking#players", as: :ranking_players
      get "ranking/budokai_solo", to: "ranking#budokai_solo", as: :ranking_budokai_solo
      get "ranking/budokai_party", to: "ranking#budokai_party", as: :ranking_budokai_party
      get "ranking/guilds", to: "ranking#guilds", as: :ranking_guilds
    end

    scope module: :accounts do
      # Dashboard
      get '/dashboard', to: "dashboard#index", as: :dashboard

      # Settings
      get '/settings', to: "settings#index", as: :settings
      put '/settings/update_personal_informations', to: "settings#update_personal_informations", as: :settings_update_personal_informations
      get '/settings/change_password', to: "settings#change_password", as: :settings_change_password
      put '/settings/update_password', to: "settings#update_password", as: :settings_update_password
    end

    scope :admins, as: :admin, module: :admins do
      # Dashboard
      get '/', to: "dashboard#index", as: :dashboard
  
      # Accounts
      get '/accounts', to: "accounts#index", as: :accounts
      get '/accounts/:account_id/add_cash_points', to: "accounts#add_cash_points", as: :accounts_add_cash_points
      put '/accounts/:account_id/add_cash_points', to: "accounts#add_cash_points_submit", as: :accounts_add_cash_points_submit
      get '/accounts/:account_id/ban', to: "accounts#ban_form", as: :accounts_ban_form
      post '/accounts/:account_id/ban', to: "accounts#ban_form_submit", as: :accounts_ban_form_submit
  
      # Characters
      get '/characters', to: "characters#index", as: :characters
    end
  end
end
