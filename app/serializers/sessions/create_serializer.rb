class Sessions::CreateSerializer < UserSerializer
  attributes :id, :email, :auth_token, :current_level_id
end
