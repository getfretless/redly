class AddPostTypeToPosts < ActiveRecord::Migration
  def up
    add_column :posts, :post_type, :integer, default: 0
    Post.find_each do |post|
      post.post_type = 1 if post.body.present?
      post.post_type = 0 if post.link.present?
      post.save!
    end
  end

  def down
    remove_column :posts, :post_type
  end
end
