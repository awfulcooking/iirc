module IIRC
  module Redis
    def self.included(*)
      require 'redis'
    end

    def redis
      @redis ||= ::Redis.new
    end
  end
end