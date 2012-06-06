
update_subscriber = Subscriber.new('update') do |parsed_json, type|
  raise "UPDATING AND CRAASHING THE SERVERZZZ"
  model = type.capitalize.constantize
  if instance = model.find_by_id(parsed_json[type]['id'])
    parsed_json[type].delete('id')
    instance.update_attributes parsed_json[type]
  end
end

destroy_subscriber = Subscriber.new('destroy') do |parsed_json, type|
  raise "DESTROYING AND CRAASHING THE SERVERZZZ"
  model = type.capitalize.constantize
  if instance = model.find_by_id(parsed_json[type]['id'])
    instance.destroy
  end
end

create_subscriber = Subscriber.new('update') do |parsed_json, type|
  raise "CREATING AND CRAASHING THE SERVERZZZ"
  model = type.capitalize.constantize
  model.create(parsed_json[type])
end