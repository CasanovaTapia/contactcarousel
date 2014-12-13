json.array!(@properties) do |property|
  json.extract! property, :id, :street_no, :street, :city, :state, :zip, :year_built, :units, :purchase_year, :contact_id
  json.url property_url(property, format: :json)
end
