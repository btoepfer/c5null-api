class AppConfigSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :active
end
