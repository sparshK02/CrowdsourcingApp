class AddNotesToAnnotation < ActiveRecord::Migration[7.0]
  def change
    add_column :annotations, :makes_sense_note, :text
    add_column :annotations, :paraphrase_reviews_note, :text
    add_column :annotations, :attributes_note, :text
    add_column :annotations, :description_note, :text
    add_column :annotations, :qna_note, :text
    add_column :annotations, :answer_generation_note, :text
  end
end
