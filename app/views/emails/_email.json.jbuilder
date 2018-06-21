json.extract! email, :id, :to, :sub, :body, :student_id, :created_at, :updated_at
json.url email_url(email, format: :json)
