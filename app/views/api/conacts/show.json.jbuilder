json.id @contact.id
json.first_name @contact.first_name
json.last_name @contact.last_name
json.fullname @contact.fullname
json.email @contact.email
json.phone_number @contact.phone_number


json.formatted do
  json.updated_at contact.friendly_updated_at
  json.
end