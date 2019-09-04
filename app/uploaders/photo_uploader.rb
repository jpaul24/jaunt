class PhotoUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave

  def default_public_id
    'kdddn0dbt7vzga3ilauo'
  end
  # Remove everything else
end
