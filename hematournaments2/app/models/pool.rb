class Pool < ApplicationRecord
  validates :tournament_id, :name, presence: true
  belongs_to :tournament
end
