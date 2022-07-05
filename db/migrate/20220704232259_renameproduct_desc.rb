class RenameproductDesc < ActiveRecord::Migration[7.0]
  def change
    rename_column :annotations, :productDesc, :attributes
  end
end
