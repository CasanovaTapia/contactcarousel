json.array!(@contacts) do |contact|
  json.extract! contact, :id, :name, :entity, :phone, :alt_phone, :dead_phone, :email, :alt_email, :dead_email
  json.url contact_url(contact, format: :json)
end
