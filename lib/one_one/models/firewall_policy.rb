module OneOne
  class FirewallPolicy < Base
    attribute :id
    attribute :name
    attribute :description
    attribute :state
    attribute :creation_date
    attribute :default
    attribute :rules
    attribute :server_ips
    attribute :cloudpanel_id
  end
end
