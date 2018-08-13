class PhotoUploader < Shrine 
 include ImageProcessing::MiniMagick
    plugin :processing
    plugin :versions
  plugin :activerecord
  plugin :determine_mime_type
  plugin :logging, logger: Rails.logger
  plugin :remove_attachment
  plugin :store_dimensions
  plugin :validation_helpers
  plugin :versions, names: [:original, :large, :medium, :small, :thumb]
end 