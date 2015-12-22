module OneOne
  class ImageMapping
    include Kartograph::DSL

    kartograph do
      mapping Image

      property :id, scopes: [:read]
      property :name, scopes: [:read, :create, :update]
      property :os_family, scopes: [:read]
      property :os, scopes: [:read]
      property :os_version, scopes: [:read]
      property :architecture, scopes: [:read]
      property :os_image_type, scopes: [:read]
      property :type, scopes: [:read]
      property :min_hdd_size, scopes: [:read]
      property :licenses, [:read]
      property :cloudpanel_id, scopes: [:read]
      property :state, scopes: [:read]
      property :description, scopes: [:read, :create, :update]
      property :hdds, scopes: [:read]
      property :server_id, scopes: [:read, :create]
      property :frequency, scopes: [:read, :create, :update]
      property :num_images, scopes: [:read, :create]
      property :creation_date, scopes: [:read]
    end
  end
end
