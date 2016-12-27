class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :current_level_id, :created_at, :updated_at
end

