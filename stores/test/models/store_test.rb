require 'test_helper'

class StoreTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "should not save store without city" do
	  store = Store.new
	  assert_not store.save, "Saved the store without a city"
	end

	test "stores_count" do
		assert_equal 102,Store.count
	end
end
