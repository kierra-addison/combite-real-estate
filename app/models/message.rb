class Message < ApplicationRecord
	attr_encrypted :email, key: :encrypted_key
  attr_encrypted :first_name, key: :encrypted_key
  attr_encrypted :last_name, key: :encrypted_key
  attr_encrypted :mobile_number, key: :encrypted_key

  private
    def encrypted_key
      Rails.application.credentials.dig(:attr_encrypted, :key)
    end
end