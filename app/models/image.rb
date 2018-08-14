class Image < ApplicationRecord
	# adds an `image` virtual attribute
include ::PhotoUploader::Attachment.new(:image)
has_attached_file :image, default_url: "/myapp/images/:style/missing.png"
    validates_attachment_file_name :image, matches: [/png\Z/, /jpeg\Z/, /tiff\Z/, /bmp\Z/, /jpg\Z/]
end
