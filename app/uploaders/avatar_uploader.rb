class AvatarUploader < CarrierWave::Uploader::Base

  # Include RMagick or MiniMagick support:
  # include CarrierWave::RMagick
  include CarrierWave::MiniMagick

  # Include the Sprockets helpers for Rails 3.1+ asset pipeline compatibility:
  include Sprockets::Helpers::RailsHelper
  include Sprockets::Helpers::IsolatedHelper

  # Choose what kind of storage to use for this uploader:
  storage :file
  # storage :fog

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/avatar/#{model.id}"
  end

  # Provide a default URL as a default if there hasn't been a file uploaded:
  def default_url
  #   # For Rails 3.1+ asset pipeline compatibility:
    asset_path("fallback/" + [version_name, "default.png"].compact.join('_'))
  #
  #   "/images/fallback/" + [version_name, "default.png"].compact.join('_')
  end

  # Process files as they are uploaded:
  # process :scale => [200, 300]
  #
  # def scale(widthm, height)
  #   # do something
  # end
  # Create different versions of your uploaded files:
  
  process :scale => [180, 180]

  
  version :large do
    process :crop
    process :resize_to_limit => [180, 180]
  end
  
  version :normal, :from_version => :large do
    process :resize_to_limit => [50, 50]
  end
  
  version :thumb, :from_version => :normal do
    process :resize_to_limit => [24, 24]
  end
    
  
 

  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  def extension_white_list
    %w(jpg jpeg gif png)
  end

  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  def filename
    "avatar.png" if original_filename
  end
  
  def scale(width, height)
    img = MiniMagick::Image.open(self.path)
    if img[:width] < width || img[:height] < height
      resize_to_fit(500, 500)
    else
      resize_to_limit(500, 500)
    end
  end
        
  def crop
    if model.crop_x.present?
      manipulate! do |img|
        img.crop("#{model.crop_w}x#{model.crop_h}+#{model.crop_x}+#{model.crop_y}")
        img = yield(img) if block_given?
        img
      end
    end
  end
end
