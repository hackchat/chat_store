
Thread.new do
  Subscriber.new('create') do |parsed_json, type|
    attr_hash = parsed_json[type]
    model = type.capitalize.constantize
    if Subscriber.model_has_attributes(attr_hash, model)
      model.create(attr_hash)
    end
  end
end

Thread.new do
  Subscriber.new('destroy') do |parsed_json, type|
    if type
      attr_hash = parsed_json[type]
      model = type.capitalize.constantize
      token = attr_hash['token']
      if instance = model.where(token: token).first
        instance.destroy
      end
    end
  end
end

Thread.new do
  Subscriber.new('update') do |parsed_json, type|
    attr_hash = parsed_json[type]
    model = type.capitalize.constantize
    token = attr_hash['token']
    if instance = model.where(token: token).first &&
      Subscriber.model_has_attributes(attr_hash, model)
      attr_hash.delete['token'] #can't update token
      instance.update_attributes attr_hash
    end
  end
end
