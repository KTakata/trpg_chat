TrpgChat::Application.routes.draw do

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
  controller :t_sessions do
    resources :t_logs, path: 't_sessions/:t_session_id/t_logs', :only => [:index, :new, :create, :show]
    post 't_session/:t_session_id/t_logs', action: :create
  end
end
