# == Schema Information
#
# Table name: fighters
#
#  id         :integer          not null, primary key
#  first_name :string           not null
#  last_name  :string
#  club       :string
#  gender     :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class FighterTest < ActiveSupport::TestCase
   test "fighter name" do
     @fighter = fighters(:leyla)
     assert_equal "#{@fighter.id}: Leyla Azizova, DEMAS", @fighter.name
   end
end
