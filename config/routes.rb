require 'api_constraints'

NcesLookup::Application.routes.draw do

root :to => 'home#index'

  namespace :api, :defaults => {:format => :json} do
    scope :module => :v1, :constraints => ApiConstraints.new(:version => 1, :default => true) do
    	get 'search', to: 'schools#search'
      resources :schools

    end
  end

end
