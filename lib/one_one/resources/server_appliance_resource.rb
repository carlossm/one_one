module OneOne
  class ServerApplianceResource < ResourceKit::Resource
    resources do
      default_handler do |response|
        fail "Unexpected response status #{response.status}... #{response.body}"
      end

      action :all, 'GET /v1/server_appliances' do
        handler(200) do |response|
          ServerApplianceMapping.extract_collection(response.body, :read)
        end
      end
    end
  end
end
