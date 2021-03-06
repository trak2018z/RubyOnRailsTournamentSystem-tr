Rails.application.routes.draw do
  resources :matches  
  resources :teams
  resources :tournaments do
    resources :participants
  end
  devise_for :users
  get 'home/about'
  root 'home#index'

  post 'join_existing_team' => 'teams#join_existing_team'
  post 'team/:id/leave_team_path' => 'teams#leave_team', as: 'leave_team'
  post 'tournament/:id/join_tournament' => 'tournaments#join_tournament', as: 'join_tournament'
  post 'tournament/:id/leave_tournament' => 'tournaments#leave_tournament', as: 'leave_tournament'
  post 'tournament/:id/start_tournament' => 'tournaments#start_tournament', as: 'start_tournament'
  get 'tournament/:id/update_tournament_brackets' => 'tournaments#update_tournament_brackets', as: 'update_tournament_brackets'
  post 'tournament/:id/remove_all_matches' => 'tournaments#remove_all_matches', as: 'remove_all_matches'
  post 'tournament/:id/insert_match_score' => 'tournaments#insert_match_score', as: 'insert_match_score'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
