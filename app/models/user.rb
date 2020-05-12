class User < ApplicationRecord
    has_many :entries, dependent: :destroy
end
