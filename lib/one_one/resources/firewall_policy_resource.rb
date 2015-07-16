module OneOne
  class FirewallPolicyResource < BaseResource
    resources do
      default_handler do |response|
        fail "Unexpected response status #{response.status}... #{response.body}"
      end

      action :all, 'GET /v1/firewall_policies' do
        handler(200) do |response|
          FirewallPolicyMapping.extract_collection(response.body, :read)
        end
      end

      action :find, 'GET /v1/firewall_policies/:id' do
        handler(200) do |response|
          FirewallPolicyMapping.extract_collection(response.body, :read)
        end
      end

      action :create, 'POST /v1/firewall_policies/' do
        body { |object| FirewallPolicyMapping.representation_for(:create, object) }
        handler(202) do |response|
          FirewallPolicyMapping.extract_single(response.body, :read)
        end
      end
    end
  end
end
