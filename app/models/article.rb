class Article < ApplicationRecord
  validates :title, presence: true
  validates :body, presence: true
  # default_scope { order(created_at: :desc) }
  # Specify order in which data picked from database
  # desc for reverse order
  self.per_page = 3 # Set default number articles per page

  belongs_to :user

  def self.search(term, page)
    if term
      # where('title LIKE ?', "%#{term}%").paginate(page: page, per_page: 5).order('id DESC')
      where('title LIKE ?', "%#{term}%").paginate(page: page).reverse_order
    else
      # paginate(page: page, per_page: 5).order('id DESC')
      paginate(page: page).reverse_order
    end
  end
end
