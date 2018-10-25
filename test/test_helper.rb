require "minitest/autorun"
require_relative "../helper"

class TestHelper< Minitest::Test
  def test_read_file
    file = read_file "sample_one"
    assert_equal file.class, File
    assert file.size != nil , file.size
    assert file.first ==
    "----o--oo----o--ooo--ooo---------o---oo-o----oo---o--o---------o----o------o----------------o--o--o-\n", file.first 
  end

  def test_similarity_percentage_not_equal_size
    assert_equal similarity_percentage([1],[2,3]),0
  end
end