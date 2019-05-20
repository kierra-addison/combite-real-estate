json.extract! message, :id, :email, :first_name, :last_name, :mobile_number, :enquiry, :read, :created_at, :updated_at
json.url message_url(message, format: :json)
