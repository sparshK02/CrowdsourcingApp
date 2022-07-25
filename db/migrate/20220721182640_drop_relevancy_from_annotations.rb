class DropRelevancyFromAnnotations < ActiveRecord::Migration[7.0]
  def change
    remove_column :annotations, :highly_relevant
    remove_column :annotations, :partially_relevant
    remove_column :annotations, :irrelevant
    remove_column :annotations, :notSure
    add_column :annotations, :highly_relevant_reviews, :text
    add_column :annotations, :highly_relevant_product_attributes, :text
    add_column :annotations, :highly_relevant_qnas, :text
    add_column :annotations, :partially_relevant_reviews, :text
    add_column :annotations, :partially_relevant_product_attributes, :text
    add_column :annotations, :partially_relevant_qnas, :text
    add_column :annotations, :irrelevant_reviews, :text
    add_column :annotations, :irrelevant_product_attributes, :text
    add_column :annotations, :irrelevant_qnas, :text
    add_column :annotations, :not_sure_reviews, :text
    add_column :annotations, :not_sure_product_attributes, :text
    add_column :annotations, :not_sure_qnas, :text
  end
end
