class AddMakesSenseToAnnotation < ActiveRecord::Migration[7.0]
  def change
    add_column :annotations, :makes_sense, :boolean
  end
end
