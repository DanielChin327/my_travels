class Country < ApplicationRecord
  has_many :posts, dependent: :destroy
end
