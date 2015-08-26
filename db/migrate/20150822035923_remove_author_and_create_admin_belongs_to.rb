class RemoveAuthorAndCreateAdminBelongsTo < ActiveRecord::Migration
  def change
    remove_column :posts, :author
    add_reference :posts, :admin, index: true, foreign_key: true
  end
end
