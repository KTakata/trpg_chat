# -*- encoding : utf-8 -*-
module ApplicationHelper
  def show_log(logs, player)
    body = ""
    #TODO:ログを最新から○個持ってくる
    logs.each do |log|
      case log.log_type
      when 'said'
        if log.npc_chara_name == 'Game Master' #GM
          body += "<tr><td>#{log.npc_chara_name}</td><td colspan='4'>#{log.body}</td></tr>"
        elsif log.npc_chara_name == log.player.player_type && log.player.character.name.nil?#player no chara name
          body += "<tr><td>#{log.player.player_type}</td><td colspan='4'>#{log.body}</td></tr>"
        elsif log.npc_chara_name == log.player.player_type #player character has name
          body += "<tr><td>#{log.player.character.name}</td><td colspan='4'>#{log.body}</td></tr>"
        else
          body += "<tr><td>#{log.player.player_type}<br/>(#{log.npc_chara_name})</td><td colspan='4'>#{log.body}</td></tr>"
        end
      when 'dice'
        body += "<tr><td>#{log.player.player_type}</td><td>#{log.many}D#{log.d_type}</td><td>=></td><td>ダイスの目:#{log.body}</td><td>計：#{log.score}</td></tr>"
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
