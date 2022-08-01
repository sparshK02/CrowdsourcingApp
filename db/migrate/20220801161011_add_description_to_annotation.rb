class AddDescriptionToAnnotation < ActiveRecord::Migration[7.0]
  def change
    add_column :annotations, :highly_relevant_descriptions, :text
    add_column :annotations, :partially_relevant_descriptions, :text
    add_column :annotations, :irrelevant_descriptions, :text
    add_column :annotations, :not_sure_descriptions, :text
  end
end
