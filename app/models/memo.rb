class Memo < ApplicationRecord
  belongs_to :user
  has_many :comments

  validates :title, presence: true
  validates :goal, presence: true
end
