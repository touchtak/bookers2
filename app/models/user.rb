class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :books, dependent: :destroy

  validates :name, length: {minimum: 2, message: "is too short (minimum is 2 characters)"}
  validates :name, length: {maximum: 20, message: "is too long (maximum is 20 characters)" }
  validates :name, uniqueness: true
  validates :introduction, length: {maximum: 50, message: "is too long (maximum is 50 characters)" }

  has_one_attached :profile_image

  def get_profile_image
    if profile_image.attached?
      profile_image.variant(resize_to_fill: [100, 100])
    else
      'no_image.jpg'
    end
  end

end
