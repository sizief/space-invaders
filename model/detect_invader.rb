require_relative './radar'

class DetectInvader
  attr_reader :message
  SIMILARITY_PERCENTAGE = 80 # decrease this number would results in fewer detection 
  DENSITY_PERCENTAGE = 0.7 # in noise free radar images, this sohould be 1 

  def initialize radar, invader
    @radar = radar
    @number_of_windows = radar.windows_total
    @invader = invader
    @invader_data = invader.data
    @invader_type = invader.type
    @invader_density = invader.density
    @message= "\n"
  end

  def detect
    @number_of_windows.times do
      number_of_o = current_window.join.tr("-","").size   
      if number_of_o > @invader_density * DENSITY_PERCENTAGE  # how many "o" in each window can be a sign of a suspicious object? 
        if (invader_similarity_percentage @invader_data, current_window) > similarity_percentage(current_window)
          @message += "--"*30 
          @message += "\n"+get_position_data+"\n"
          @message += "similarity to #{@invader_type} invader: %" + (invader_similarity_percentage @invader_data, current_window).to_s+"\n"
          @message += make_image_visible(current_window)+"\n"
        end
      end  
      @radar.next_window
    end  
  end

  private
  def get_position_data
    "start: #{@radar.start_position}, end: #{@radar.end_position}"
  end

  def current_window
    @radar.current_window
  end

  def invader_similarity_percentage invader, current_window
    return 0 if current_window.size != invader.size
    similarity = 0
    invader.each_with_index do |element, index| 
      similarity += array_similarity_percentage element, current_window[index]
    end   
    similarity / current_window.size
  end 

  def similarity_percentage current_window
    percentage = @radar.edge_case_level == 0 ? SIMILARITY_PERCENTAGE : SIMILARITY_PERCENTAGE - (@radar.edge_case_level*10) 
  end

end