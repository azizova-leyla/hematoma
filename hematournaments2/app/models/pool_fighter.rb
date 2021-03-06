# == Schema Information
#
# Table name: pool_fighters
#
#  id         :integer          not null, primary key
#  pool_id    :integer          not null
#  fighter_id :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class PoolFighter < ApplicationRecord
  validates :fighter_id, :pool_id, presence: true
  validates_uniqueness_of :fighter_id, scope: :pool_id

  belongs_to :fighter
  belongs_to :pool

  def tournament_name
    Pool.find(pool_id).tournament_name
  end

  def pool_name
    Pool.find(pool_id).name
  end

  def fighter_name
    Fighter.find(fighter_id).name
  end
end
