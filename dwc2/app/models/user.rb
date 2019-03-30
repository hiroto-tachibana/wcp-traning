class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :post_images, dependent: :destroy
  has_many :books, dependent: :destroy

  attachment :profile_image
  
  validates :introduction, length: { maximum: 50 } 
  validates :name, length: { in: 2..20 },  presence: true

end
