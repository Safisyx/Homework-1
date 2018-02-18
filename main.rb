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

def count_phone(contacts, to_find)
  new_contacts = filter_phone(contacts, to_find)
  new_contacts.reduce(0) do |sum, element|
    sum+=1
  end
end

def count_email(contacts, to_find)
  new_contacts = filter_email(contacts, to_find)
  new_contacts.reduce(0) do |sum, element|
    sum+=1
  end
end

#Helper methods

def divisor
  puts "----------------------------------------------------"
end

def list_contacts(contacts)
  contacts.each do |contact|
    puts "-" + contact[:name]
    puts " " + contact[:phone]
    puts " " + contact[:email]
    puts
  end
end


#Main program

contacts = read_contacts
new_shape = change_shape(contacts)
puts
divisor
puts "List of contacts:"
new_shape.each do |contact|
  contact.each { |key, value|
    puts " -#{key}: #{value}"
  }
end
divisor
puts
divisor

contacts_filter_by_phone = filter_phone(contacts, "+1")
puts 'Contacts with phone number containing "+1":'
list_contacts(contacts_filter_by_phone)
divisor
puts
divisor

contacts_filter_by_email = filter_email(contacts, ".org")
puts 'Contacts with email containing ".org":'
list_contacts(contacts_filter_by_email)
divisor
puts
divisor

count_by_phone = count_phone(contacts, "+1")
puts "Number of contacts with phone containing \"+1\": #{count_by_phone}"
divisor
puts
divisor

count_by_email = count_email(contacts, ".org")
puts "Number of contacts with email containing \".org\": #{count_by_email}"
divisor
