def read_file file
  File.open("radar_files/"+file, "r") 
end

def convert_to_array file
  image_array = Array.new
  file.each_line do |line|
    image_array << line.chars - ["\n"]
  end
  image_array
end

def make_image_visible multi_line_array
  image = ""
  multi_line_array.each do |line|
    image += line.join.tr("-", " ")+"\n"
  end
  image
end

def array_similarity_percentage source, target
  return 0 if source.size != target.size
  similarity = 0
  source.each_with_index do |element,index|
    similarity +=100 if element == target[index]
  end
  similarity/target.size
end

def get_width obj
  obj.data.first.size
end

def get_height obj
  obj.data.size
end