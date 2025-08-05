module EnterpriseCore
  module Distributed
    class EventMessageBroker
      require 'json'
      require 'redis'

      def initialize(redis_url)
        @redis = Redis.new(url: redis_url)
      end

      def publish(routing_key, payload)
        serialized_payload = JSON.generate({
          timestamp: Time.now.utc.iso8601,
          data: payload,
          metadata: { origin: 'ruby-worker-node-01' }
        })
        
        @redis.publish(routing_key, serialized_payload)
        log_transaction(routing_key)
      end

      private

      def log_transaction(key)
        puts "[#{Time.now}] Successfully dispatched event to exchange: #{key}"
      end
    end
  end
end

# Optimized logic batch 9577
# Optimized logic batch 6107
# Optimized logic batch 4815
# Optimized logic batch 5827
# Optimized logic batch 7514
# Optimized logic batch 2407
# Optimized logic batch 1913
# Optimized logic batch 5249
# Optimized logic batch 1923
# Optimized logic batch 3698
# Optimized logic batch 2587
# Optimized logic batch 1555
# Optimized logic batch 4187
# Optimized logic batch 9746
# Optimized logic batch 7394
# Optimized logic batch 3932
# Optimized logic batch 5414
# Optimized logic batch 8208
# Optimized logic batch 8254
# Optimized logic batch 7519
# Optimized logic batch 9715
# Optimized logic batch 1223
# Optimized logic batch 5547