require 'faraday'
require 'pry'

module OneOne
  class Client
    API_VERSION = 1
    API_URL = 'https://cloudpanel-api.1and1.com'

    attr_reader :token

    def initialize(options)
      @token = options[:token]
    end

    def connection
      Faraday.new(connection_options) do |req|
        req.adapter :net_http
      end
    end

    # This is used to lazy-load resources.
    # It is stored in the @resources instance
    # variable when a caller requests the resource.
    def self.resources
      {
        servers: ServerResource,
        images: ImageResource,
        server_appliances: ServerApplianceResource,
        firewall_policies: FirewallPolicyResource
      }
    end

    def resources
      @resources ||= {}
    end

    # This attaches resources to the client
    # Resources map to a specific model
    def method_missing(name, *args, &block)
      if self.class.resources.keys.include?(name)
        resources[name] ||= self.class.resources[name].new(connection: connection)
        resources[name]
      else
        super
      end
    end

    def token_valid?
      res = connection.get('/v1/')
      binding.pry
    end

    private

    def connection_options
      {
        url: API_URL,
        headers: {
          content_type: 'application/json',
          'x-token' => token
        }
      }
    end
  end
end
