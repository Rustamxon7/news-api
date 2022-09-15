Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'

  namespace :api do
    namespace :v1 do
      resources :sources do
        collection do
          get :kun
          get :vox
          get :cnet
          get :technewsworld
        end
    
        match '/scrape', to: 'sources#scrape', via: :post, on: :collection
      end

      get '/top_news', to: 'top_news#index'

      get '/:url', to: 'sources#website'
    end
  end
end
