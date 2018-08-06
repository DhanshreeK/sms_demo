json.extract! customer_email, :id, :email, :created_at, :updated_at
json.url customer_email_url(customer_email, format: :json)
