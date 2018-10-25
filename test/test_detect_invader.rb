require "minitest/autorun"
require_relative "../model/detect_invader"

class TestDetectInvader< Minitest::Test
  def setup
    @invader = Invader.new("f8")
    @radar= Radar.new @invader
    @di = DetectInvader.new @radar, @invader
  end

  def test_initialize
    assert_equal @di.class, DetectInvader
  end

  def test_detect
    invader = Invader.new("f11")
    radar= Radar.new invader, "sample_two"
    di = DetectInvader.new radar, invader
    di.detect
    assert di.message.include? "%100"
  end

end