json.extract! student_detail, :id, :first_name, :middle_name, :last_name, :email, :address, :created_at, :updated_at
json.url student_detail_url(student_detail, format: :json)
