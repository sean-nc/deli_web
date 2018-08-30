Rails.application.routes.draw do
  root                    'admin#index'
  devise_for              :users,                 controllers: { registrations: "registrations" }
end
