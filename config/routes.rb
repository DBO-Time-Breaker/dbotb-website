Rails.application.routes.draw do
  scope module: :web do
    scope module: :public do
      get '/', to: "home#index", as: :root
      post "register", to: "home#account_register", as: :account_register
    end
  end
end
