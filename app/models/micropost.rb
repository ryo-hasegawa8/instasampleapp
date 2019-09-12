class Micropost < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_users, through: :likes, source: :user
  default_scope -> { order(created_at: :desc) }
  mount_uploader :picture, PictureUploader
  validates :user_id, presence: true
  # validates :picture, presence: true
  validate  :picture_size

 

    # アップロードされた画像のサイズをバリデーションする
    def picture_size
      if picture.size > 5.megabytes
        errors.add(:picture, "should be less than 5MB")
      end
    end
      
    def liked(user)
      likes.create(user_id: user.id)
    end
   
    def unliked(user)
      likes.find_by(user_id: user.id).destroy
    end
    
    def liked?(user)
      liked_users.include?(user)
    end
end
