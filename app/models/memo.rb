class Memo < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  validates :title, presence: true
  validates :goal, presence: true

  def self.search(search)
    if search != ''
      Memo.where('title LIKE(?)', "%#{search}%")
    else
      Memo.all
    end
  end

  def favorited?(user)
    favorites.where(user_id: user.id).exists?
  end
end
