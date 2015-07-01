require 'bundler/setup'
require 'one_one'
require 'pry'

# create a client
client = OneOne::Client.new(token: ARGV.shift)

# list all servers
servers = client.servers.all
puts "You have #{servers.length} servers"
servers.each do |s|
  puts ' - ' << s.name
  puts '   - ' << s.id
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
# puts "\nCreate a server"
# server = OneOne::Server.new(
#   name: 'connor-test',
#   description: 'creating a server right now',
#   appliance_id: client.server_appliances.all.first.id,
#   #
#   # One of these object represents instance types
#   #
#   hardware: {
#     'vcore' => 2,
#     'cores_per_processor' => 1,
#     'ram' => 2,
#     'hdds' => [
#       {
#         'size' => 40,
#         'is_main' => true
#       },
#       {
#         'size' => 20,
#         'is_main' => false
#       }
#     ]
#   }
# )

# server = client.servers.create(server)

# sleep 10

# puts server.id

# list all servers again
# servers = client.servers.all
# puts "You have #{servers.length} servers"

# Delete the server we just created
