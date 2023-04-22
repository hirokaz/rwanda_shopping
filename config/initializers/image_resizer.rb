class ImageResizer
  def self.resize(image)
    image.variant(resize_to_limit: [300, nil])
  end
end
