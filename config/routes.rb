Rails.application.routes.draw do


  ### Guest ###
    devise_for :users,
      :path           => "users",
      controllers: { :registrations  =>      'muzzle/users/registrations',
                     :sessions       =>      'muzzle/users/sessions',
                     :omniauth_callbacks =>  'muzzle/users/omniauth_callbacks',
                     :omniauth_providers =>  [:twitter, :google] }

  scope :module => :muzzle, :as => :muzzle do
    get     '',                 to: 'root#top'

    get     'users/edit'
    get     'users',            to: 'users#show',       as: 'users'
    patch   'users/:id',        to: 'users#update'

    get     'orders/new'
    post    'orders',           to: 'orders#create',    as: 'orders'
    delete  'orders',           to: 'orders#destroy'
    get     'orders/thank'

    get     'contacts/new',     to: 'contacts#new'
    get     'contacts/sent',    to: 'contacts#sent'
    post    'contacts',         to: 'contacts#create'

    get     'items/index',      as: 'items'

    get     'cds/index',        as: 'cds'

    get     'interviews/index', as: 'interviews'

    get     'offshots/index',   as: 'offshots'

    get     'blogs/index',      as: 'blogs'
  end

###Admin###

  devise_for :admins,
    :path           => "admins",
    controllers: { :registrations  => 'admin/admins/registrations',
                   :sessions       => 'admin/admins/sessions' }

  namespace :admin do
    get     '/top',          to: 'root#top',         as: 'root'
    post    '/top',          to: 'root#create',      as: 'top'
    patch   '/tops',         to: 'root#update',      as: 'tops'

    get     'muzzles',       to: 'muzzles#index'

    get     'users/index'
    get     'users/edit'
    patch   '/users/:id',    to: 'users#update'

    get     'orders',        to: 'orders#index',     as: 'orders'
    patch   '/orders/:id',   to: 'orders#update',    as: 'order'

    get     'mails/index',   as: 'mails'

    get     'offshots',      to: 'offshots#index',   as: 'offshots'
    post    'offshot',       to: 'offshots#create',  as: 'offshot'
    delete  '/offshot/:id',  to: 'offshots#destroy', as: 'delete_offshot'

    resources :lyrics,      only: [:index, :new, :create, :edit, :update, :destroy] do
      collection do
        get 'get_tracks'
      end
    end

    resources :items,       only: [:index, :new, :create, :edit, :update, :destroy]
    resources :cds,         only: [:index, :new, :create, :edit, :update, :destroy]
    resources :interviews,  only: [:index, :new, :create, :edit, :update, :destroy]
    resources :blogs,       only: [:index, :new, :create, :edit, :update, :destroy]
  end
end
