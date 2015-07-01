module OneOne
  class ServerMapping
    include Kartograph::DSL

    kartograph do
      mapping Server

      property :id, scopes: [:read]
      property :description, scopes: [:read, :create]
      property :name, scopes: [:read, :create]
      property :first_password, scopes: [:read]
      property :status, scopes: [:read]
      property :hardware, scopes: [:read, :create]
      property :creation_date, scopes: [:read]
      property :appliance_id, scopes: [:read, :create]
      property :ips, scopes: [:read]
    end
  end
end
