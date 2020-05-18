class EntrySerializer < ActiveModel::Serializer
  attributes :id, :content, :wordcount, :goal, :created_at
  has_one :user


end
