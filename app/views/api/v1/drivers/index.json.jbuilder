json.array! @drivers do |driver|
  json.extract! driver, :id, :latitude, :longitude
end
