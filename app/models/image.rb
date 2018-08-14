class Image < ApplicationRecord
	# adds an `image` virtual attribute
include ::PhotoUploader::Attachment.new(:image)
    validates_attachment :image, matches: [/png\Z/, /jpeg\Z/, /tiff\Z/, /bmp\Z/, /jpg\Z/]
end
