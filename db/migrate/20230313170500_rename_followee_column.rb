class RenameFolloweeColumn < ActiveRecord::Migration[7.0]
  def change
    rename_column :follows, :followee_id, :followed_user_id
  end
end
