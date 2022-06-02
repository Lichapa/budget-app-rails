class Entity < ApplicationRecord
  belongs_to :user
  belongs_to :group, class_name: 'Group'
end
