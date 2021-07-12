Rails.application.routes.draw do

  root 'login#new'
  
  get 'sign_in', to: 'login#new'
  post 'sign_in', to: 'login#create', as: 'log_in'
  post 'register', to: 'register#index'
  post 'registered', to: 'register#register'
  delete 'logout', to: 'login#destroy'
  get 'home', to: 'home#index'
  get 'doubtForm', to: 'doubt#doubtForm'
  post 'raiseDoubt', to: 'doubt#raise_doubt'
  post 'addComment', to: 'comment#add'
  get 'doubt_detail', to: 'doubt#doubt_detail'
  post 'accept_doubt', to: 'doubt#accept_doubt'
  post 'answerDoubt', to: 'doubt#answer_doubt'
  post 'escalateDoubt', to: 'doubt#escalate_doubt'

end
