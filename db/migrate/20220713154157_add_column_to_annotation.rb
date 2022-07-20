class AddColumnToAnnotation < ActiveRecord::Migration[7.0]
  def change
    add_column :annotations, :irrelevant, :text
    add_column :annotations, :notSure, :text
  end
end
