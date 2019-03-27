class Book < ApplicationRecord

    belongs_to :user

    has_many :post_images, dependent: :destroy

    attachment :profile_image

end
