module OneOne
  class ServerApplianceResource < BaseResource
    include ErrorHandler

    resources do
      action :all, 'GET /v1/server_appliances' do
        handler(200) do |response|
          ServerApplianceMapping.extract_collection(response.body, :read)
        end
      end

      action :find, 'GET /v1/server_appliances/:id' do
        handler(200) do |response|
          ServerApplianceMapping.extract_single(response.body, :read)
        end
      end
    end
  end
end
