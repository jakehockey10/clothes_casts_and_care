class RemoveReferenceToAdminInPosts < ActiveRecord::Migration
  def change
    remove_reference :posts, :admin
  end
end
