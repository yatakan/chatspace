json.messages @messages.each do |message|
  json.name     message.user.name
  json.date     message.date_time
  json.text     message.text
  json.image    message.image
  json.id       message.id
end
