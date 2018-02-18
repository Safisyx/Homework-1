require 'json'

def read_contacts
  contacts_json = File.read("contacts.json")
  return JSON.parse(contacts_json, { symbolize_names: true })
end

def change_shape(contacts)
  contacts.map do |contact|
    {contact[:name]=> contact[:phone]}
  end
end

def filter_phone(contacts, to_find)
  contacts.select do |contact|
    contact[:phone].include? to_find
  end
end

def filter_email(contacts, to_find)
  contacts.select do |contact|
    contact[:email].include? to_find
  end
end

contacts = read_contacts
new_shape = change_shape(contacts)
print new_shape
puts
contacts_filter_by_phone = filter_phone(contacts, "+1")
print contacts_filter_by_phone
puts
contacts_filter_by_email = filter_email(contacts, ".org")
print contacts_filter_by_email
puts
