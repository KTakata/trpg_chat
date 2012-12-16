# -*- encoding : utf-8 -*-
#初期ユーザー作成
user = User.create!(name: "admin", nick_name: "Admin User", email: "root@admin.com", password: "root")

#TODO:開発がすすんだら別のrakeコマンドに移す
#初期ユーザー所属テストシナリオ作成
progress_session = TSession.create!(system_name: "ダブルクロス The 3rd Edition", scenario_name: "テストシナリオ", start_flag: false, end_flag: false)
past_session = TSession.create!(system_name: "アリアンロッドRPG 2E", scenario_name: "テストシナリオ2", start_flag: true, end_flag: true)
Player.create!(user_id: user.id, t_session_id: progress_session.id, player_type: "Game Master")
Player.create!(user_id: user.id, t_session_id: past_session.id, player_type: "Player 1st")