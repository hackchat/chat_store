Thread.new do
  update_subscriber = Subscriber.new('update') do |parsed_json, type|
    model = type.capitalize.constantize
    if instance = model.find_by_id(parsed_json[type]['id'])
      parsed_json[type].delete('id')
      instance.update_attributes parsed_json[type]
    end
  end
end

Thread.new do
  destroy_subscriber = Subscriber.new('destroy') do |parsed_json, type|
    if type
      model = type.capitalize.constantize
      if instance = model.find_by_id(parsed_json[type]['id'])
        instance.destroy
      end
    end
  end
end

Thread.new do
  create_subscriber = Subscriber.new('create') do |parsed_json, type|
    model = type.capitalize.constantize
    model.create(parsed_json[type])
  end
end