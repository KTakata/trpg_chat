# -*- encoding : utf-8 -*-
module ApplicationHelper
  def show_log(logs, player)
  logs.each do |log|
    case log.log_type
    when 'said'
      body ="<td>#{player.character.name}</td><td>#{log.body}</td>"
      return body
    when 'dice'
      body = "<td>#{player.character.name}</td><td>ダイスの目：#{log.body}合計：#{log.score}</td>"
      return body
    when 'move'
      #TODO:マップ移動処理
    when 'first'
      body = "<tr><td colspan='2'>#{log.body}</td></tr>"
      return body
    else
      raise 'unkown type error'
    end
  end
end


end
