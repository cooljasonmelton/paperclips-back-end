class EntrySerializer < ActiveModel::Serializer
  attributes :id, :title, :wordcount, :goal, :timestamps, include: true
  has_one :user


end
