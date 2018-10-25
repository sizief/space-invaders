require_relative '../helper'

class Radar
  attr_reader :data, :current_window, :start_position, :end_position, 
              :windows_total, :window_height, :window_width

  def initialize invader_object, data_path="sample_one"
    @window_width = get_width invader_object
    @window_height = get_height invader_object
    @start_position = {row: 0, column: 0}
    @end_position = {row: @window_height-1, column: @window_width-1}
    @data = convert_to_array read_file(data_path)
    @current_window = get_window @data, @start_position, @end_position
    @windows_total = @data.first.size * @data.size 
  end
   
  def next_window margin=1
    if (@start_position[:column] + margin) > @data.first.size 
      @start_position[:column] = 0 
      @start_position[:row] += 1
    else 
      @start_position[:column] = @start_position[:column] + margin
    end
    @end_position[:row] = @start_position[:row] + @window_height-1
    @end_position[:column] = @start_position[:column] + @window_width-1
    @current_window = get_window @data, @start_position, @end_position 
  end

  private
  def get_window data, start_position, end_position
    window = data[start_position[:row]..end_position[:row]]
    window.each_with_index do |row, index|
      window[index] = row[start_position[:column]..end_position[:column]] 
    end
  end
end