module OneOne
  class ImageResource < ResourceKit::Resource
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
          ServerMapping.extract_single(response.body, :read)
        end

        handler(404) { |_| nil }
      end
    end
  end
end
