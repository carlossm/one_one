require 'bundler/setup'
require 'one_one'
require 'pry'

# create a client
# TODO: revoke the token, checked it in.
client = OneOne::Client.new(token: ARGV.shift)

# list all servers
servers = client.servers.all
puts "You have #{servers.length} servers running"
servers.each do |s|
  puts ' - ' << s.name
end

# List all available images
puts "\nHere are all the images you can use to launch"
images = client.images.all
puts "You have #{images.length} images to choose from"
#
# List all available server appliances
puts "\nHere are all the server appliances you can use to launch"
appliances = client.server_appliances.all
puts "You have #{appliances.length} appliances to choose from"

# firewall policies
puts "\nHere are all your policies master"
policies = client.firewall_policies.all
puts "You have #{policies.length} policies to choose from"

# Create a server
puts "\nCreate a server"

# Delete the server we just created
#
