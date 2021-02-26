class Comment < ApplicationRecord
 validates :content, :user, presence: true
 validates :user, length: { minimum: 5 }
 validates :content, length: { minimum: 5 }
 belongs_to :blog
end
