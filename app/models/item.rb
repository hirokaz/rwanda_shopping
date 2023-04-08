class Item < ApplicationRecord
  belongs_to :category
  belongs_to :cart_items, optional: true
  validates :name, presence: true
  validates :description, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 9_999_999 },
                    format: { with: /\A[0-9]+\z/ }

  scope :price_asc, -> { order(price: :asc) }
  scope :price_desc, -> { order(price: :desc) }

  has_one_attached :top_image
  has_many_attached :images
  validate :image_type, :image_size

  def image_type
    images.each do |image|
      if !image.blob.content_type.in?(%('image/jpeg image/png'))
        image.purge
        errors.add(:images, "Add by format jpeg or png")
      end
    end
  end

  def image_size
    images.each do |image|
      if image.blob.byte_size > 1.megabyte
        image.purge
        errors.add(:images, "Add by size less than 1MB")
      end
    end
  end
end
