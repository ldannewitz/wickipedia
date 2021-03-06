Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'welcome#index'
  get '/about' => 'welcome#about'

  resources :users do
    member do
      put 'promote_to_admin'
      put 'demote_from_admin'
    end
  end

  put '/:category/articles/:id/publish' => 'articles#publish_article', as: 'publish_article'
  put '/:category/articles/:id/unpublish' => 'articles#unpublish_article', as: 'unpublish_article'
  put '/:category/articles/:id/feature' => 'articles#feature_article', as: 'feature_article'
  put '/:category/articles/:id/unfeature' => 'articles#unfeature_article', as: 'unfeature_article'

  get '/register' => 'users#new'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#login'
  get '/logout' => 'sessions#logout'
  get '/search' => 'search#index', as: 'search'

  get '/:category' => 'categories#show', as: 'a_category'

  get '/:category/articles/:id' => 'articles#show', as: 'articles'
  get '/articles/new' => 'articles#new', as: 'new_article'
  post '/articles' => 'articles#create', as: 'create_article'
  get '/:category/articles/:id/edit' => 'articles#edit', as: 'edit_article'
  post '/:category/articles/:id/edit' => 'articles#update', as: 'update_article'
  delete '/:category/articles/:id' => 'articles#destroy', as: 'delete_article'


  get '/:category/articles/:id/comments' => 'comments#index', as: 'article_comments'
  post '/:category/articles/:id/comments' => 'comments#create', as: 'create_comment'
  get '/:category/articles/:id/comments/new' => 'comments#new', as: 'new_comment'
  get '/:category/articles/:id/comments/edit' => 'comments#edit', as: 'edit_comment'
  put '/:category/articles/:id/comments' => 'comments#update', as: 'update_comment'
  delete '/:category/articles/:id/comments' => 'comments#destroy', as: 'delete_comment'

  get '/:category/articles/:id/revisions' => 'articles#show_revisions', as: 'revisions'


  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
