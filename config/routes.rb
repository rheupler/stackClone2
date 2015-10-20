Rails.application.routes.draw do
  resources :users
  resources :questions do
    resources :answers
    member do
      put "upvote" => "questions#upvote"
      put "downvote" => "questions#downvote"
    end
  end


root 'questions#index'
get "/log-in" => "sessions#new"
post "/log-in" => "sessions#create"
get "/log-out" => "sessions#destroy", as: :log_out
get "/all_questions" => "questions#all_questions"
end
