Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  resources :posts, path: 'blog'
  
  post '/contact', to: 'welcome#contact'
	root 'welcome#index'
end
