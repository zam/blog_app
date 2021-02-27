class Blog < ApplicationRecord
  validates :title, :body, :author, presence: true
  validates :title, length: { minimum: 10 }
  validates :body, length: { minimum: 20 }
  validates :author, length: { minimum: 5 }

  has_many :comments
end
