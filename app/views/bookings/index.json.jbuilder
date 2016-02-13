json.array!(@bookings) do |booking|
  json.extract! booking, :id, :date, :shift_id, :editor_id, :typist_id, :reader_id
  json.url booking_url(booking, format: :json)
end
