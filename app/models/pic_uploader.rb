class PicUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick
  storage :file

  version :thumb do
    process :resize_to_fill => [200, 200]
  end

  version :gallery do
    process :resize_to_fill => [600, 400]
  end


  def store_dir
    'public/uploads'
  end

  def identifier!
    self.file.identifier
  end
end
