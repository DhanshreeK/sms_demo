class BulkSmsSetting < ApplicationRecord
	 include Activity

	belongs_to :center
	belongs_to :student
	after_create :send_bulk_message

    def send_bulk_message
		if SmsSetting.first.send_sms == "Yes"
		require "rubygems"
		require "net/https"
		require "uri"
		require "json"
		uname = "pawarakash235@gmail.com"
		hash = "4a9bfc715e5a833379d6c647fec325808c3a1d218cacb91f9c4fa5339e597043"
		byebug
		message = self.body
		numbers = self.student.contact_no
		sender = "TXTLCL" 
		requested_url = 'http://api.textlocal.in/send/?' + "username=" + uname + "&hash=" + hash + "&numbers=" + numbers + "&message=" + message + "&sender=" + sender
		uri = URI.parse(requested_url)
		http = Net::HTTP.start(uri.host, uri.port)
		request = Net::HTTP::Get.new(uri.request_uri)
		res = http.request(request)
		response = JSON.parse(res.body)
		puts (response)
    end
 end
end
