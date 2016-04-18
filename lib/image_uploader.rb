class ImageUploader < CarrierWave::Uploader::Base

  include Cloudinary::CarrierWave

  version :standard do
    eager
    resize_to_fill(800, 600)
  end

end