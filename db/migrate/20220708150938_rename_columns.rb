class RenameColumns < ActiveRecord::Migration[7.0]
  def change
    rename_column :annotations, :assigned?, :assigned
    rename_column :annotations, :finished?, :finished
  end
end
