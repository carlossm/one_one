module OneOne
  class FirewallPolicyResource < ResourceKit::Resource
    resources do
      action :all, 'GET /api/v1/firewall_policies' do
        handler(200) do |response|
          FirewallPolicyMapping.extract_collection(response.body, :read)
        end
      end
    end
  end
end
