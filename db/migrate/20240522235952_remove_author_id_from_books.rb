class RemoveAuthorIdFromBooks < ActiveRecord::Migration[7.0]
  def change
    remove_reference :books, :author, index: true, foreign_key: false
  end
end
