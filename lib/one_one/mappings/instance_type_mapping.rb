module OneOne
  class InstanceTypeMapping
    include Kartograph::DSL

    kartograph do
      mapping InstanceType

      property :id, scopes: [:read]
      property :name, scopes: [:read]
      property :hardware, scopes: [:read]
    end
  end
end
