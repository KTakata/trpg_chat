TrpgChat::Application.routes.draw do
  root :to => "sessions#create"

  controller :sessions do
    get 'login' => :new
    post 'login' => :create
    delete 'logout' => :destroy
  end

  get "my_page" => "my_page#index"

  controller :t_sessions do
    resources :t_sessions, path: 't_session', only: [:index, :new, :show, :create, :destroy]
    post 't_session/:id/start_recruit', action: :start_recruit
    post 't_session/:id/join_request', action: :join_request
    post 't_session/:id/cancel_request', action: :cancel_request
    post 't_session/:id/remove_player', action: :remove_player
    post 't_session/:id/set_player_no', action: :set_player_no
    post 't_session/set_player', action: :set_player
  end

  #TRPGセッション配下
  controller :t_logs do
    resources :t_logs, path: 't_session/:t_session_id/t_logs', only: [:index, :new, :create, :show]
    post 't_session/:t_session_id/t_logs/said_player', action: :said_player, as: :said_player
    post 't_session/:t_session_id/t_logs/dice_roll', action: :dice_roll, as: :dice_roll
    put 't_session/:t_session_id/t_logs/dice_roll', action: :dice_roll, as: :dice_roll
    post 't_session/:t_session_id/t_logs/create_npc', action: :create_npc, as: :create_npc
    put 't_session/:t_session_id/t_logs/create_npc', action: :create_npc, as: :create_npc
    post 't_session/:t_session_id/t_logs/set_name', action: :set_name, as: :set_name
    put 't_session/:t_session_id/t_logs/set_name', action: :set_name, as: :set_name
  end
  resources :battle_map, path: 't_sessions/:t_session_id/battle_map', only: [:index, :new, :create, :show]

end
