# == Schema Information
#
# Table name: matches
#
#  id              :integer          not null, primary key
#  pool_id         :integer          not null
#  order           :integer          not null
#  red_fighter_id  :integer          not null
#  blue_fighter_id :integer          not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class Match < ApplicationRecord
  validates :pool_id, :red_fighter_id, :blue_fighter_id, :order, presence: true
  belongs_to :pool
  belongs_to :red_fighter,
    class_name: 'Fighter',
    primary_key: :id,
    foreign_key: :red_fighter_id
  belongs_to :blue_fighter,
    class_name: 'Fighter',
    primary_key: :id,
    foreign_key: :blue_fighter_id
  has_many :exchanges

  def red_fighter_name
    Fighter.find(red_fighter_id).name
  end

  def blue_fighter_name
    Fighter.find(blue_fighter_id).name
  end

  def remove_exchange(exchange_id)
    exchanges_to_remove = exchanges.where('exchange_id = ?', exchange_id)
    exchanges_to_remove.each do |exchange|
      exchanges.delete(exchange.id)
    end
  end
end
