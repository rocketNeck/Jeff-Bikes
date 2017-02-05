class PhotoUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick
  include Sprockets::Rails::Helper

  storage :fog

  def store_dir
    "uploade/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  version :tiny do
    process :resize_to_fill => [20,20]
  end

  version :bike_listing do
    process :resize_to_fill => [300,300]
  end

  version :thumb do
    process :resize_to_fill => [100,100]
  end

  def extension_whitelist
    %w(jpg jpeg gif png)
  end


end
