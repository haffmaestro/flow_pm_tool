ActiveModel::Serializer.setup do |config|
  config.embed = :objects
  config.embed_in_root = true
end