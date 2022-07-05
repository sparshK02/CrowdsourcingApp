class RemoveEvidencesFromAnnotations < ActiveRecord::Migration[7.0]
  def change
    remove_column :annotations, :evidences
    add_column :annotations, :reviews, :text
    add_column :annotations, :productDesc, :text
    add_column :annotations, :QnAs, :text
  end
end
