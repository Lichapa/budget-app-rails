class Group < ApplicationRecord
  belongs_to :user, class_name: 'User'
  has_many :entities, class_name: 'Entity', foreign_key: :group_id, dependent: :destroy
end
