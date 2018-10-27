class Invader
  # put the image of new invader in radar folder. Then call it by file name.
  attr_accessor :type, :data, :density

  def initialize type
    @type = type
    @data = convert_to_array read_file(@type)
    @density = @data.join.tr("-","").size   
  end
end