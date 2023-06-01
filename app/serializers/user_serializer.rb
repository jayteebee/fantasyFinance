class UserSerializer
  include JSONAPI::Serializer
  attributes :id, :email, :created_at
end





# ACCESS SERIALIZER DATA FOR SINGLE RECORD

# UserSerializer.new(resource).serializable_hash[:data][:attributes].to_json
# And multiple records by,
# UserSerializer.new(resource).serializable_hash[:data].map{|data| data[:attributes].to_json}