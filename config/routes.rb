Rails.application.routes.draw do
  scope :api, module: :api do
    post "register", to: "accounts#register"
  end
end
