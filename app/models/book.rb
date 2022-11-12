class Book < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :book_comments, dependent: :destroy

  # 引数で渡されたユーザidがFavoritesテーブル内に存在（exists?）するかどうかを調べる
  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end

  validates :title, presence: true
  validates :body, presence: true,
            length: { maximum: 200 }

end
