class AddIndexToUsersAnnotatorId < ActiveRecord::Migration[7.0]
  def change
    add_index :users, :annotatorID, unique:true
  end
end
