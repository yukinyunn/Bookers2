class RenameCommnetColumnToBookComments < ActiveRecord::Migration[6.1]
  def change
    rename_column :book_comments, :commnet, :comment
  end
end
