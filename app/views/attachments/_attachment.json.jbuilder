json.extract! attachment, :id, :picture, :created_at, :updated_at
json.url attachment_url(attachment, format: :json)
