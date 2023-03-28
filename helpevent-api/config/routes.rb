require 'api_constraints'

Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'
  namespace :api, defaults: { format: :json } do
    scope module: :v1, 
          constraints: ApiConstraints.new(version: 1, default: true) do 
    end

    # for mobile fetchies
    scope module: :v2, 
      constraints: ApiConstraints.new(version: 2, default: false) do 
    end
  end
end
