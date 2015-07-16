require 'bundler/setup'
require 'one_one'
require 'securerandom'
require 'pry'

# create a client
client = OneOne::Client.new(token: ARGV.shift)

# list all servers
servers = client.servers.all
server  = nil

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

# Instance types
puts "\nList of instance types"
instance_types = client.servers.instance_types
puts "You have #{instance_types.length} instance types to choose from"

instance_types.each do |it|
  pp it
  puts "\n -- \n"
end

puts "\n Create a firewall policy"
policy = OneOne::FirewallPolicy.new(
  name: "connor_test-#{SecureRandom.hex(5)}",
  description: "connor_test-#{SecureRandom.hex(5)}",
  rules: [
    {
      protocol: 'TCP',
      port_from: 80,
      port_to: 80,
      source: '0.0.0.0'
    },
    {
      protocol: 'TCP',
      port_from: 443,
      port_to: 443,
      source: '0.0.0.0'
    }
  ]
)

fp = client.firewall_policies.create(policy)

# Create a server
puts "\nCreate a server if none present"
unless servers.length > 0
  puts "\n-> None present"

  server = OneOne::Server.new(
    name: 'connor-test',
    description: 'creating a server right now',
    appliance_id: client.server_appliances.all.first.id,
    hardware: instance_types.first.hardware
  )

  server = client.servers.create(server)
end

server ||= servers.first

loop do
  server = client.servers.find(id: server.id)
  pp server

  # client.servers.power_on(id: server.id)
  # client.servers.power_off(id: server.id)

  # ensure server is powered off
  intermediate = %w(DEPLOYING REMOVING POWERING_OFF POWERING_ON)
  until (server = client.servers.find(id: server.id)).status['state'] == 'POWERED_OFF'
    puts "[STATE] - #{server.status['state']}"
    unless intermediate.include? server.status['state']
      client.servers.power_off(id: server.id)
    end

    sleep 5
  end
  puts "[STATE] - #{server.status['state']}"

  client.servers.delete(id: server.id)
  puts '[STATE] - server deleted'
  break
end
