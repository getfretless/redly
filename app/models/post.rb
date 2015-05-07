class Post < ActiveRecord::Base
  belongs_to :category
  belongs_to :user
  default_scope { order(updated_at: :desc).includes(:category) }
  validates :title, length: { maximum: 500 }, presence: true
  validates :link, presence: true, if: :link?
  validates :body, presence: true, if: :text?
  validates :category_id, presence: true
  enum post_type: [:link, :text]

  acts_as_commentable
end
