json.array!(@calls) do |call|
  json.extract! call, :id, :contact_id, :dial, :conversation, :invest, :timing, :motivator
  json.url call_url(call, format: :json)
end
