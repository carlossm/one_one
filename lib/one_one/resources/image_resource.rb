module OneOne
  class ImageResource < BaseResource
    include ErrorHandler

    resources do
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
        body { |object| ImageMapping.representation_for(:create, object) }
        handler(202) do |response|
          ImageMapping.extract_single(response.body, :read)
        end
      end

      action :update, 'PUT /v1/images/:id' do
        body {|image| ImageMapping.representation_for(:update, image) }
        handler(200) do |response|
          ImageMapping.extract_single(response.body, :read)
        end
      end
    end
  end
end
