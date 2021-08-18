class Build < ApplicationRecord
  belongs_to :user
  has_many :items
  has_many :posts
end
