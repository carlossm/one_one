require 'bundler/setup'
require 'one_one'
require 'pry'

# create a client
client = OneOne::Client.new(token: '337c0f24c0e0f66d18bae948570f1f75')

# list all servers
servers = client.servers.all
puts "You have #{servers.length} servers running"
servers.each do |s|
  puts ' - ' << s.name
end

# List all available images
puts 'Here are all the images you can use to launch'
images = client.images.all
puts "You have #{images.length} images to choose from"

# Create a server

# Delete the server we just created
#
