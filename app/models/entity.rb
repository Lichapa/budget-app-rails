class Entity < ApplicationRecord
  belongs_to :user
  belongs_to :group, class_name: 'Group'

  def self.total_amount(entity)
    sum = 0
    entity.each do |e|
      sum += e.amount
    end
    sum
  end
end
