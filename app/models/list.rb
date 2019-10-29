class List < ApplicationRecord
  belongs_to :user
  has_many :tasks
  has_many :favorites
end
