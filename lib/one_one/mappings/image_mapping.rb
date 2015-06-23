module OneOne
  class ImageMapping
    include Kartograph::DSL

    kartograph do
      mapping Image

      property :id, scopes: [:read]
      property :name, scopes: [:read]
      property :os_family, scopes: [:read]
      property :os, scopes: [:read]
      property :os_version, scopes: [:read]
      property :os_image_type, scopes: [:read]
      property :min_hdd_size, scopes: [:read]
      property :state, scopes: [:read]
      property :creation_date, scopes: [:read]
    end
  end
end
