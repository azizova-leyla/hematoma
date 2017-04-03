class PoolFighter < ApplicationRecord
  validates :fighter_id, :pool_id, presence: true
  validates_uniqueness_of :fighter_id, scope: :pool_id

  belongs_to :fighter
  belongs_to :pool
end
