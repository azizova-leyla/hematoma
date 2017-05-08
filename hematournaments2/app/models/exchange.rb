# == Schema Information
#
# Table name: exchanges
#
#  id                 :integer          not null, primary key
#  match_id           :integer          not null
#  scoring_fighter_id :integer          not null
#  order_in_match     :integer          not null
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

class Exchange < ApplicationRecord
  belongs_to :match
  has_many :exchange_rules,
    class_name: 'ExchangeRule',
    primary_key: :id,
    foreign_key: :exchange_id
  has_many :rules,
    through: :exchange_rules,
    source: :rule
  belongs_to :scoring_fighter,
    class_name: 'Fighter',
    primary_key: :id,
    foreign_key: :scoring_fighter_id
end
