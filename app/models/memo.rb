class Memo < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  validates :title, presence: true
  validates :goal, presence: true

  enum status: { public: 0, private: 1 }, _prefix: true

  def self.search(search)
    if search != ''
      Memo.where('title LIKE(?)', "%#{search}%")
    else
      Memo.all
    end
  end

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

  def toggle_status!
    if status_private?
      status_public!
    else
      status_private!
    end
  end
end
