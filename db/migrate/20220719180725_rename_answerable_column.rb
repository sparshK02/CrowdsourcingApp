class RenameAnswerableColumn < ActiveRecord::Migration[7.0]
  def change
    rename_column :annotations, :answerable?, :answerable
  end
end
