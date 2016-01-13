module ErrorHandler
  def self.included(base)
    base.send(:resources) do
      default_handler do |response|
        next if response.status.to_s =~ /^20[0-9]$/
        raise OneOne::Error.new(response)
      end
    end
  end
end
