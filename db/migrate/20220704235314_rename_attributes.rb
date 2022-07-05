class RenameAttributes < ActiveRecord::Migration[7.0]
  def change
    rename_column :annotations, :attributes, :productAttributes 
  end
end
