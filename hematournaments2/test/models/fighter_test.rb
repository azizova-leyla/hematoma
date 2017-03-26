require 'test_helper'

class FighterTest < ActiveSupport::TestCase
   test "fighter name" do
     @fighter = fighters(:leyla)
     assert_equal "Leyla Azizova", @fighter.name
   end
end
