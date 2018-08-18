require 'shrine'
Shrine.plugin :presign_endpoint, presign_options: { method: :put }

if Rails.env.development?
  require "shrine/storage/file_system"
  Shrine.storages = {
    cache: Shrine::Storage::FileSystem.new("public", prefix: "uploads/cache"),
    store: Shrine::Storage::FileSystem.new("public", prefix: "uploads/store")
  }
elsif Rails.env.test?
  require 'shrine/storage/memory'
  Shrine.storages = {
    cache: Shrine::Storage::Memory.new,
    store: Shrine::Storage::Memory.new
  }
else
  require "shrine/storage/s3"
  Shrine::Storage::S3.new(
    access_key_id:     Rails.application.secrets.AWS_ACCESS_KEY_ID,
    secret_access_key: Rails.application.secrets.AWS_SECRET_ACCESS_KEY,
    region:            Rails.application.secrets.AWS_REGION,
    bucket:            Rails.application.secrets.AWS_BUCKET_NAME
    
  )
  Shrine::Storage::S3.new(prefix: "cache", **s3_options)
  Shrine::Storage::S3.new(prefix: "store", **s3_options)
  Shrine::Storage::S3.new(host: "https://qsetsmsdemo.herokuapp.com/", **s3_options)

end
# Shrine.plugin :activerecord # or :activerecord
Shrine.plugin :presign_endpoint
# Shrine.plugin :cached_attachment_data # for retaining the cached file across form redisplays
# Shrine.plugin :restore_cached_data # re-extract metadata when attaching a cached file
# Shrine.plugin :rack_file # for non-Rails apps
# Shrine.plugin :endpoint_provider

require 'shrine/storage/file_system'

Shrine.storages = {
  # temporary storage
  cache: Shrine::Storage::FileSystem.new('public', prefix: 'uploads/cache'),

  # permanent storage
  store: Shrine::Storage::FileSystem.new('public', prefix: 'uploads/store'),
}

Shrine.plugin :activerecord
Shrine.plugin :cached_attachment_data # for forms