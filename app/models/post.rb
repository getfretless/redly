class Post < ActiveRecord::Base
  validates :title, length: { maximum: 500 }, presence: true
  validates :link, presence: true, if: :link?
  validates :body, presence: true, if: :text?
  enum post_type: [:link, :text]
end
