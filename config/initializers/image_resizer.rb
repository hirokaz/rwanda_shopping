# frozen_string_literal: true

#image_resize
class ImageResizer
  def self.resize(image)
    image.variant(resize_to_limit: [300, nil])
  end
end
