class Entity < ApplicationRecord
  belongs_to :user
  belongs_to :group, class_name: 'Group'

  validates :name, :amount, :group_id, :user_id, presence: true
end
