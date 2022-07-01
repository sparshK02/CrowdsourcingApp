class AddAnnotatorIdToAnnotations < ActiveRecord::Migration[7.0]
  def change
    add_column :annotations, :annotatorID, :string
  end
end
