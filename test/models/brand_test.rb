require 'test_helper'

class BrandTest < ActiveSupport::TestCase
  test "should not save article without title" do
    article = Brand.new
    assert_not article.save
  end
end
