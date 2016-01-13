module OneOne
  class Error < StandardError
    attr_accessor :response
    
    def initialize response
      @response = response
      super("#{response.status}: #{response.body}")
    end
  end
end
