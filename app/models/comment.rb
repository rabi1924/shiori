class Comment < ApplicationRecord
  belongs_to :memo
  belongs_to :user

  validates :content, presence: true
end
