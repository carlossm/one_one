require 'one_one/version'
require 'resource_kit'
require 'kartograph'

module OneOne
  # client
  autoload :Client, 'one_one/client'

  # models
  autoload :Base, 'one_one/models/base'
  autoload :Server, 'one_one/models/server'
  autoload :Image, 'one_one/models/image'
  autoload :ServerAppliance, 'one_one/models/server_appliance'
  autoload :FirewallPolicy, 'one_one/models/firewall_policy'
  autoload :InstanceType, 'one_one/models/instance_type'

  # mappings
  autoload :ServerMapping, 'one_one/mappings/server_mapping'
  autoload :ImageMapping, 'one_one/mappings/image_mapping'
  autoload :ServerApplianceMapping, 'one_one/mappings/server_appliance_mapping'
  autoload :FirewallPolicyMapping, 'one_one/mappings/firewall_policy_mapping'
  autoload :InstanceTypeMapping, 'one_one/mappings/instance_type_mapping'

  # resources
  autoload :BaseResource, 'one_one/resources/base_resource'
  autoload :ServerResource, 'one_one/resources/server_resource'
  autoload :ImageResource, 'one_one/resources/image_resource'
  autoload :ServerApplianceResource, 'one_one/resources/server_appliance_resource'
  autoload :FirewallPolicyResource, 'one_one/resources/firewall_policy_resource'

  # errors
  autoload :ErrorHandler, 'one_one/error_handler'
  autoload :Error, 'one_one/error'
end
