json.extract! enquiry, :id, :full_name, :email, :contact_no, :alternate_contact_no, :center_id, :created_at, :updated_at
json.url enquiry_url(enquiry, format: :json)
