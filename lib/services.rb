require 's3_storage'

module Services
  def self.cloud_storage
    @cloud_storage ||= S3Storage.build(ENV['AWS_S3_BUCKET_NAME'])
  end
end