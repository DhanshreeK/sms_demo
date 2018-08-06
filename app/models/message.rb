class Message < ApplicationRecord
	belongs_to :contact 
	after_create :send_message
	after_update :send_message
	
	def send_message
	    require 'uri'
	    require 'net/http'
	    url = URI("http://api.msg91.com/api/sendhttp.php?sender=JAWAAN&route=4&mobiles=#{self.contact.contact_number}&authkey=230171A29wCbr1l5b67ee39&country=91&message=#{self.body}")
        # url = URI("http://api.msg91.com/api/sendhttp.php?sender=MSGIND&route=4&mobiles=#{self.contact.contact_number}&authkey=230171A29wCbr1l5b67ee39&country=91&message=#{self.body}")
	    http = Net::HTTP.new(url.host, url.port)
	    request = Net::HTTP::Get.new(url)
	    response = http.request(request)
	    puts response.read_body
	end  
end