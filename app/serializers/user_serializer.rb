class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :current_goal, :entries 

end
