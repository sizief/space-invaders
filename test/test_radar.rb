require "minitest/autorun"
require_relative "../model/radar"

class TestRadar< Minitest::Test
  def setup
    @radar = Radar.new Invader.new("f8")
  end
  
  def test_create_instance
    assert_equal @radar.class, Radar
  end

  def test_get_current_window
    assert_equal @radar.current_window.class, Array
    assert_equal @radar.current_window.size, 8, "#{@radar.inspect}"
    assert_equal @radar.current_window.first.size, 8
  end

  def test_next_window
    @radar.next_window
    assert_equal @radar.current_window.first, "---o--oo".chars 
  end

end