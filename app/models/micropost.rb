class Micropost < ActiveRecord::Base
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 140 }
  
  belongs_to :user, dependent: :destroy
  
  has_many :favorite_relationships, class_name: "Favoriterelationship",
                                    foreign_key: "micropost_id",
                                    dependent: :destroy
  has_many :fusers, through: :favorite_relationships, source: :fuser

  #has_many :favorite_relationships, class_name: "Favorite",
                       #foreign_key: "favorite_id",
                       #dependent: :destroy
  #has_many :favorite_microposts, through: :favorite_relationships, source: :favorite
  
  #has_many :unfavorite_relationships, class_name: "Favorite",
                       #foreign_key: "unfavorite_id",
                       #dependent: :destroy
  #has_many :unfavorite_microposts, through: :unfavorite_relationships, source: :unfavorite
  #through:xxxxはhas_manyの後の:xxxxを表している!
  #source:ooooはthrough:xxxxを通してみたclass_nameのクラスの中のbelongs_to :ooooを表している
  
   # 他のユーザーのコメントお気に入りにする
  def favorites(other_micropost)
    favorite_relationships.create(fuser_id: other_micropost.id)
  end
  
  # お気に入りにしているユーザーのコメントを解除する
  def unfavorites(other_micropost)
    favorite_relationships.find_by(fuser_id: other_micropost.id).destroy
  end
  
   # あるユーザーのコメントをお気に入りにしているかどうか？
  def favorite?(other_micropost)
    favorite_microposts.include?(other_micropost)
  end

end
