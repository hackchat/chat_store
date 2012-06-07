class Subscriber

  def initialize(channel, port=6379, &block)
    @redis = Redis.new(port: port, timeout: 0)
    subscribe(channel, &block)
  end

  def self.model_has_attributes(attr_hash, model )
    attr_hash.keys.all? { |key| model.accessible_attributes.include?(key) }
  end

  private

  def subscribe(channel, &block)
    @redis.subscribe(channel) do |on|
      on.message do |channel, message|
        parsed_json = JSON.parse(message)
        yield(parsed_json, parsed_json["type"])
      end
    end
  end

end
