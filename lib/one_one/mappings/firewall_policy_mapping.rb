module OneOne
  class FirewallPolicyMapping
    include Kartograph::DSL

    kartograph do
      mapping FirewallPolicy

      property :id, scopes: [:read]
      property :name, scopes: [:read, :create]
      property :description, scopes: [:read, :create]
      property :state, scopes: [:read]
      property :creation_date, scopes: [:read]
      property :default, scopes: [:read]
      property :rules, scopes: [:read, :create]
      property :server_ips, scopes: [:read]
      property :cloudpanel_id, scopes: [:read]
    end
  end
end
