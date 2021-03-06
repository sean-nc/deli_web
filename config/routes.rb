Rails.application.routes.draw do
  root                    to:                     redirect(path: 'admin/index')
  devise_for              :users,                 controllers: { registrations: "registrations" }
  
  scope :admin, controller: :admin do
    get 'index'
    get 'categories'
    get 'orders'
  end

  scope :admin do
    resources             :cheeses do
      member do
        resources         :cheese_orders,         only: [:index, :new, :create, :destroy]
      end
    end
    resources             :milks,                 only: [:index, :new, :create, :destroy]
    resources             :regions,               only: [:index, :new, :create, :destroy]
    resources             :strengths,             only: [:index, :new, :create, :destroy]
    resources             :suppliers
    resources             :textures,              only: [:index, :new, :create, :destroy]
    resources             :wines,                 only: [:index, :new, :create, :destroy]
  end
end
