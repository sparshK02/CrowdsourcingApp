class AddProductDescToAnnotation < ActiveRecord::Migration[7.0]
  def change
    add_column :annotations, :productDesc, :text
  end
end
