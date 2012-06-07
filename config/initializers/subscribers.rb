
Thread.new do
  update_subscriber = Subscriber.new('update') do |parsed_json, type|
    model = type.capitalize.constantize
    if instance = model.find(parsed_json[type])
      parsed_json[type].delete('id')
      instance.update_attributes parsed_json[type]
    end
  end
end

# Thread.new do
  create_subscriber = Subscriber.new('create') do |parsed_json, type|
    model = type.capitalize.constantize
    if parsed_json[type].keys.all? { |key| model.accessible_attributes.include?(key) }
      model.create(parsed_json[type])
    end
  end
# end

Thread.new do
  destroy_subscriber = Subscriber.new('destroy') do |parsed_json, type|
    if type
      model = type.capitalize.constantize
      if instance = model.where(parsed_json[type]).first
        instance.destroy
      end
    end
  end
end