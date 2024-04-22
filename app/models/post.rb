class Post < ApplicationRecord
  has_many :posts, dependent: :destroy
  belongs_to :country
end
