class CreateAnnotations < ActiveRecord::Migration[7.0]
  def change
    create_table :annotations do |t|
      t.text :product
      t.text :question
      t.text :evidences
      t.text :paraphrase
      t.text :answer
      t.text :highly_relevant
      t.text :partially_relevant
      t.boolean :assigned?, default: false
      t.boolean :finished?, default: false

      t.timestamps
    end
  end
end
