json.extract! course, :id, :course_type_id, :university_id, :no_of_seats, :fees, :created_at, :updated_at
json.url course_url(course, format: :json)
