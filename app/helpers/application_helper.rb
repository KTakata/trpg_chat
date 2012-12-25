# -*- encoding : utf-8 -*-
module ApplicationHelper
  def show_log(logs, player)
    body = ""
    logs.each do |log|
      case log.log_type
      when 'said'
        #TODO:GMは○○として発言のロジックをくむ
        body += "<tr><td>#{player.character.name}</td><td>#{log.body}</td></tr>"
      when 'dice'
        if player.player_type == 'Game Master'
          body += "<tr><td>Game Master</td><td>ダイスの目：#{log.body}/合計：#{log.score}</td></tr>"
        else
          body += "<tr><td>#{player.character.name}</td><td>ダイスの目：#{log.body}/合計：#{log.score}</td></tr>"
        end
      when 'move'
        #TODO:マップ移動処理
      when 'first'
        body += "<tr><td colspan='2'>#{log.body}</td></tr>"
      else
        raise 'unkown type error'
      end
    end
    return body
  end

end
