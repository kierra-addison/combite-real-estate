json.extract! post_attribute, :id, :attribute_name, :attribute_value, :post_id, :created_at, :updated_at
json.url post_post_attribute_url(post_attribute, format: :json)
