class Task < ApplicationRecord
  belongs_to :list
  has_one :user, through: :list
end
