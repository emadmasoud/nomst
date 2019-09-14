# config/initializers/carrierwave.rb

if Rails.env.development? 
  CarrierWave.configure do |config|
    config.storage = :file
    config.enable_processing = false
  end
else
  CarrierWave.configure do |config|
    config.fog_provider = 'fog/aws'                        # required
    config.fog_public = false
    config.fog_credentials = {
      provider:              'AWS',                        # required
      aws_access_key_id:     ENV["AWS_ACCESS_KEY"],        # required
      aws_secret_access_key: ENV["AWS_SECRET_KEY"],        # required
    }
    config.fog_directory  = ENV["AWS_BUCKET"]              # required
  end
end