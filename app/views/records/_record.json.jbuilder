json.extract! record, :id, :client_name, :client_email, :client_contact, :client_address, :service, :status, :description, :user_id, :created_at, :updated_at
json.url record_url(record, format: :json)
