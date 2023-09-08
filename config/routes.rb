Rails.application.routes.draw do
  scope module: :web do
    scope module: :public do
      get '/', to: "accounts#index", as: :account_index
      post "register", to: "accounts#create", as: :account_register
    end
  end
end
