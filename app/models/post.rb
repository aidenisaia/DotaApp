class Post < ApplicationRecord
  validates :title, presence: true
  validates :body, presence: true

  has_many :comments
  belongs_to :user
  belongs_to :build, optional: true
end
