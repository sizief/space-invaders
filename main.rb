require_relative './model/detect_invader'
require_relative './model/invader'

# F8 and F11 are the name types of invaders known space crafts
["f11", "f8"].map do |invader_type|  
  invader = Invader.new invader_type
  radar_image = Radar.new invader
  di = DetectInvader.new radar_image, invader
  di.detect
  puts di.message
end