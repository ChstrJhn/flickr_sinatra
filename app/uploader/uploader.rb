class Uploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  process :resize_to_fit => [600, 600]
  
  version :thumb do
    process :resize_to_limit => [300, 300]
  end

  storage :file

  def store_dir
    'images'
  end

  def extension_white_list
    %w(jpg jpeg gif png)
  end

end