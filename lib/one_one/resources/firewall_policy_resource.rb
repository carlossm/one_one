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
    end
  end
end
