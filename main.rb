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

contacts = read_contacts
new_shape = change_shape(contacts)
