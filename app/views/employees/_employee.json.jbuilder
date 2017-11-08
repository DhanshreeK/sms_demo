json.extract! employee, :id, :name, :designation, :adhar_card_no, :contact_no, :alternate_contact_no, :email, :joining_date, :birth_place, :address, :employee_no, :center_id, :created_at, :updated_at
json.url employee_url(employee, format: :json)
