# -*- encoding : utf-8 -*-
module ApplicationHelper
  def show_log(logs, player)
    body = ""
    #TODO:ログを最新から○個持ってくる
    logs.each do |log|
      case log.log_type
      when 'said'
        #TODO:GMは○○として発言のロジックをくむ
        if log.npc_chara_name == log.player.player_type
          body += "<tr><td>#{log.npc_chara_name}</td><td colspan='4'>#{log.body}</td></tr>"
        else
          body += "<tr><td>#{log.player.player_type}<br/>(#{log.npc_chara_name})</td><td colspan='4'>#{log.body}</td></tr>"
        end
      when 'dice'
        if log.player.player_type == 'Game Master' || log.player.character.name.nil?
          body += "<tr><td>#{log.player.player_type}</td><td>#{log.d_type}D#{log.many}</td><td>=></td><td>ダイスの目:#{log.body}</td><td>計：#{log.score}</td></tr>"
        else
          body += "<tr><td>#{player.character.name}</td><td>ダイスの目：#{log.body}/合計：#{log.score}</td></tr>"
        end
      when 'move'
        #TODO:マップ移動処理
      when 'first'
        body += "<tr><td colspan='5'>#{log.body}</td></tr>"
      else
        raise 'unkown type error'
      end
    end
    return body
  end

end
