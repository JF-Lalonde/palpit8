class ToneChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'tones'
  end

  def receive(payload)
    data = WatsonService.new.watson_tone('log/twitch_chat.log')
    unless data[:code] == 400
      data2 = data[:document_tone][:tone_categories][0][:tones].sort_by { |t| t[:score] }.reverse!.first[:tone_name]
      ActionCable.server.broadcast 'tones', {tone_data: data2}
    end
  end
end
