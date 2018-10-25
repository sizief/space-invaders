class Invader
  # put the image of new invader in radar folder. Then call it by file name.
  attr_accessor :type, :data 

  def initialize type
    @type = type.upcase
    @data = convert_to_array read_file(@type)
  end
end