# == Schema Information
#
# Table name: pools
#
#  id            :integer          not null, primary key
#  tournament_id :integer          not null
#  name          :string           not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Pool < ApplicationRecord
  validates :tournament_id, :name, presence: true
  belongs_to :tournament
  has_many :pool_fighters,
    class_name: 'PoolFighter',
    primary_key: :id,
    foreign_key: :pool_id,
    dependent: :destroy
  has_many :fighters,
    through: :pool_fighters,
    source: :fighter

  def tournament_name
    Tournament.find(tournament_id).name
  end
end
