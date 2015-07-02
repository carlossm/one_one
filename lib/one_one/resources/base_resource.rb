module OneOne
  class BaseResource < ResourceKit::Resource
    # TODO: find a way to get this working
    def shared_handlers(context)
      proc do
        default_handler do |response|
          fail "Unexpected response status #{response.status}... #{response.body}"
        end
      end.call(context)
    end
  end
end
