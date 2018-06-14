json.extract! status_update, :id, :add_status, :remarks, :created_at, :updated_at
json.url status_update_url(status_update, format: :json)
