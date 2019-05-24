class AddMemberIdToPosts < ActiveRecord::Migration[5.0]
  def change
  	add_column :posts, :author_id, :integer, index: true
    add_foreign_key :posts, :authors
  end
end
