# == Schema Information
#
# Table name: rules
#
#  id         :integer          not null, primary key
#  target     :string           not null
#  points     :integer          not null
#  is_penalty :boolean
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class RuleTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
