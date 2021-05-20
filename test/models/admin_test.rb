require 'test_helper'

class AdminTest < ActiveSupport::TestCase
  def test_the_truth
    assert true
  end
  test "should not save article without title" do
    article = Admin.new
    assert_not article.save
  end
  
end
