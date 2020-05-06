Rails.application.routes.draw do
  # deviseを導入すると自動でできるもの
  devise_for :users

  root to: 'items#index'
  resources :items

  # onlyでshowアクションのみ制限(usersというルーティングの中でもshowアクションしか使わないため。usersを利用したルーティングでは、showアクションにしか処理が流れない)
  resources :users, only: :show
end
