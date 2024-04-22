class Post < ApplicationRecord
  belongs_to :country

  validates :title, presence: true
  validates :body, presence: true
end
