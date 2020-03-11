json.array! @messages do |message|
  json.extract! message, :id, :content, :messageable_type
end
