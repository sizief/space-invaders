require "minitest/autorun"
require_relative "../model/invader"

class TestInvader< Minitest::Test
  def setup
    @invaders = [Invader.new("f8"), Invader.new("f11")]
  end

  def test_initialize
    @invaders.each do |invader|
      assert_equal invader.class, Invader
    end
  end

  def test_data
    @invaders.each do |invader|
      assert_equal invader.data.class, Array
      assert_equal invader.data.size, 8
    end
    assert_equal @invaders[0].data.first.size, 8
    assert_equal @invaders[1].data.first.size, 11
  end

end