module OneOne
  class ServerResource < BaseResource
    resources do
      ACTION_HANDLERS = %w(power_on power_off reboot)

      default_handler do |response|
        fail "Unexpected response status #{response.status}... #{response.body}"
      end

      action :all, 'GET /v1/servers' do
        handler(200) do |response|
          ServerMapping.extract_collection(response.body, :read)
        end
      end

      action :find, 'GET /v1/servers/:id' do
        handler(200) do |response|
          ServerMapping.extract_single(response.body, :read)
        end
      end

      action :delete, 'DELETE /v1/servers/:id' do
        handler(202) do |response|
          ServerMapping.extract_single(response.body, :read)
        end
      end

      action :create, 'POST /v1/servers' do
        body { |object| ServerMapping.representation_for(:create, object) }
        handler(202) do |response|
          ServerMapping.extract_single(response.body, :read)
        end
      end

      ACTION_HANDLERS.each do |action|
        action action.to_sym, 'PUT /v1/servers/:id/status/action' do
          body do |object|
            {
              action: action.upcase,
              method: (object[:method] || 'HARDWARE')
            }.to_json
          end
          handler(200, 202) do |response|
            ServerMapping.extract_single(response.body, :read)
          end
        end
      end

      action :instance_types, 'GET /v1/servers/fixed_instance_sizes' do
        handler(200) do |response|
          InstanceTypeMapping.extract_collection(response.body, :read)
        end
      end
    end
  end
end
