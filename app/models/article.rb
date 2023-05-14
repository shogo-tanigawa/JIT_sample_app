class Article < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  def upload_image(image)
    if image
      self.image.attach(image)
    end
  end
end
