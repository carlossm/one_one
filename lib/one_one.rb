require 'one_one/version'
require 'resource_kit'
require 'kartograph'
require 'active_support/all'

module OneOne
  # client
  autoload :Client, 'one_one/client'

  # models
  autoload :Base, 'one_one/models/base'
  autoload :Server, 'one_one/models/server'
  autoload :Image, 'one_one/models/image'

  # mappings
  autoload :ServerMapping, 'one_one/mappings/server_mapping'
  autoload :ImageMapping, 'one_one/mappings/image_mapping'

  # resources
  autoload :ServerResource, 'one_one/resources/server_resource'
  autoload :ImageResource, 'one_one/resources/image_resource'
end
