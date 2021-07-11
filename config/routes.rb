Rails.application.routes.draw do

  root 'login#new'
  
  get 'sign_in', to: 'login#new'
  post 'sign_in', to: 'login#create', as: 'log_in'
  delete 'logout', to: 'login#destroy'
  get 'home', to: 'home#index'
  get 'doubtForm', to: 'doubt#doubtForm'
  post 'raiseDoubt', to: 'doubt#raise_doubt'

end
