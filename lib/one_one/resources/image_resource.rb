module OneOne
  class ImageResource < BaseResource
    resources do
      default_handler do |response|
        fail "Unexpected response status #{response.status}... #{response.body}"
      end

      action :all, 'GET /v1/images' do
        handler(200) do |response|
          ImageMapping.extract_collection(response.body, :read)
        end
      end

      action :find, 'GET /v1/images/:id' do
        handler(200) do |response|
          ImageMapping.extract_single(response.body, :read)
        end
      end

      # TODO create
      action :create, 'POST /v1/images' do
        body { |object| object.to_json }
        handler(202) do |response|
          ImageMapping.extract_single(response.body, :read)
        end
      end
    end
  end
end
