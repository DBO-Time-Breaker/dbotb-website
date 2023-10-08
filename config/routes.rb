Rails.application.routes.draw do
  scope module: :web do
    scope module: :public do
      # Home
      get '/', to: "home#index", as: :root
      post "register", to: "home#account_register", as: :account_register
      
      # Ranking
      get "ranking/players", to: "ranking#players", as: :ranking_players
      get "ranking/budokai_solo", to: "ranking#budokai_solo", as: :ranking_budokai_solo
      get "ranking/budokai_party", to: "ranking#budokai_party", as: :ranking_budokai_party
      get "ranking/guilds", to: "ranking#guilds", as: :ranking_guilds
    end
  end
end
