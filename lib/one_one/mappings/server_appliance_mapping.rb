module OneOne
  class ServerApplianceMapping
    include Kartograph::DSL

    kartograph do
      mapping ServerAppliance

      property :id, scopes: [:read]
      property :name, scopes: [:read]
      property :os_family, scopes: [:read]
      property :os, scopes: [:read]
      property :os_version, scopes: [:read]
      property :architecture, scopes: [:read]
      property :os_image_type, scopes: [:read]
      property :type, scopes: [:read]
      property :min_hdd_size, scopes: [:read]
      property :licenses, scopes: [:read]
      property :automatic_installation, scopes: [:read]
    end
  end
end
