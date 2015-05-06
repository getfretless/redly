class Category < ActiveRecord::Base
  has_many :posts
  default_scope { order(:name) }
  validates :name, presence: true, length: { maximum: 20 }
  validates :title, length: { maximum: 100 }
  validates :description, length: { maximum: 500 }
  validates :sidebar, length: { maximum: 5120 }
  validates :submission_text, length: { maximum: 1024 }
end
