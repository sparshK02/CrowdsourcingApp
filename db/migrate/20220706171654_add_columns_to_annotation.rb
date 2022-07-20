class AddColumnsToAnnotation < ActiveRecord::Migration[7.0]
  def change
    add_column :annotations, :itemID, :string
    add_column :annotations, :externalSources, :text
    add_column :annotations, :answerable?, :boolean
  end
end
