class Article < ApplicationRecord
  validates :title, presence: true
  validates :body, presence: true
  default_scope { order(created_at: :desc) }
  # Specify order in which data picked from database
  # desc for reverse order
end
