require_relative './radar'

class DetectInvader
  attr_reader :message

  def initialize radar, invader
    @radar = radar
    @number_of_windows = radar.windows_total
    @invader = invader
    @invader_data = invader.data
    @invader_type = invader.type
    @message= "\n"
  end

  def detect
    (0..@number_of_windows).each do |i|
      number_of_o = current_window.join.tr("-","").size   
      if number_of_o > 30
        if (invader_similarity_percentage @invader_data, current_window) > 75
          @message += "--"*30 
          @message += "\n"+"start: #{@radar.start_position}, end: #{@radar.end_position}"+"\n"
          @message += "similarity to #{@invader_type} invader: %" + (invader_similarity_percentage @invader_data, current_window).to_s+"\n"
          @message += make_image_visible(current_window)+"\n"
        end
      end  
      @radar.next_window
    end  
  end

  private
  def current_window
    @radar.current_window
  end

  def invader_similarity_percentage invader, current_window
    return 0 if current_window.size != invader.size
    similarity = 0
    invader.each_with_index do |element, index| 
      similarity += similarity_percentage element, current_window[index]
    end   
    similarity / current_window.size
  end 

end