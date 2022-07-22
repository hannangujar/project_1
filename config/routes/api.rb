namespace :api do
    namespace :v1 do
      scope :users, module: :user do
        post '/', to: "registrations#create", as: :user_registration
      end

     resources :books

    end
  end  

  scope :api do
    scope :v1 do
      use_doorkeeper do
         skip_controllers :authoriztions, :applications, :authorized_applications
      end
    end
  end
