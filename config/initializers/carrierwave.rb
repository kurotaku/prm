CarrierWave.configure do |config|
  config.fog_credentials = {
    provider: 'AWS',
    aws_access_key_id: Rails.application.credentials.prd[:s3_access_key_id],
    aws_secret_access_key: Rails.application.credentials.prd[:s3_secret_access_key],
    region: Rails.application.credentials.prd[:s3_region],
  }

  case Rails.env
  when 'production'
    config.fog_directory = Rails.application.credentials.prd[:s3_bucket_name]
    # config.asset_host = Rails.application.credentials.prd[:s3_host_name]
  end

  config.cache_dir = "#{Rails.root}/tmp/uploads"
end
