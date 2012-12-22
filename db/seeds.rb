# -*- encoding : utf-8 -*-
#初期ユーザー作成
user = User.create!(name: "admin", nick_name: "Admin User", email: "root@admin.com", password: "root")

#TODO:開発がすすんだら別のrakeコマンドに移す
#初期ユーザー所属テストシナリオ作成
new_session = TSession.create!(system_name: "ダブルクロス The 3rd Edition", scenario_name: "テストシナリオ", t_session_status: "new")
recruitment_session = TSession.create!(system_name: "異界戦記カオスフレアSC", scenario_name: "テストシナリオ2", t_session_status: "recruit")
progress_session = TSession.create!(system_name: "ソード・ワールド2.0", scenario_name: "テストシナリオ3", t_session_status: "progress")
past_session = TSession.create!(system_name: "アリアンロッドRPG 2E", scenario_name: "テストシナリオ4", t_session_status: "end")
Player.create!(user_id: user.id, t_session_id: new_session.id, player_type: "Game Master", player_status: "join")
Player.create!(user_id: user.id, t_session_id: recruitment_session.id, player_type: "Game Master", player_status: "join")
Player.create!(user_id: user.id, t_session_id: progress_session.id, player_type: "Game Master", player_status: "join")
Player.create!(user_id: user.id, t_session_id: past_session.id, player_type: "Game Master", player_status: "join")

user = User.create!(name: "test_user", nick_name: "Test Player", email: "test@player.com", password: "test")
Player.create!(user_id: user.id, t_session_id: recruitment_session.id, player_type: "Player 1", player_status: "rsvp")

