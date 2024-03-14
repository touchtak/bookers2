class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :books, dependent: :destroy

  validates :name, presence: true, length: {minimum: 2}

  has_one_attached :profile_image

  def get_profile_image
    if profile_image.attached?
      profile_image.variant(resize_to_fill: [100, 100])
    else
      'no_image.jpg'
    end
  end

end
