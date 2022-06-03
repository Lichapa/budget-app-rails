class Entity < ApplicationRecord
  belongs_to :user
  belongs_to :group, class_name: 'Group'

  validates :name, :amount, :group_id, :user_id, presence: true
  validates :amount, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def self.total_amount(entity)
    sum = 0
    entity.each do |e|
      sum += e.amount
    end
    sum
  end
end
