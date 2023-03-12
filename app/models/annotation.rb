require 'csv'
class Annotation < ApplicationRecord

    def self.to_csv
        #attributes = %w{ id product question paraphrase answer assigned finished created_at updated_at annotatorID reviews productAttributes QnAs itemID externalSources answerable productDesc formStage highly_relevant_reviews highly_relevant_product_attributes highly_relevant_qnas highly_relevant_descriptions partially_relevant_reviews partially_relevant_product_attributes partially_relevant_qnas partially_relevant_descriptions irrelevant_reviews irrelevant_product_attributes irrelevant_qnas irrelevant_descriptions not_sure_reviews not_sure_product_attributes not_sure_qnas not_sure_descriptions makes_sense makes_sense_note paraphrase_reviews_note attributes_note description_note qna_note answer_generation_note }
        attributes = %w{ id itemID product question annotatorID paraphrase makes_sense answer makes_sense_note paraphrase_reviews_note attributes_note description_note qna_note answer_generation_note highly_relevant_reviews partially_relevant_reviews not_sure_reviews highly_relevant_product_attributes partially_relevant_product_attributes not_sure_product_attributes highly_relevant_qnas partially_relevant_qnas not_sure_qnas highly_relevant_descriptions partially_relevant_descriptions not_sure_descriptions}
        #attributes = Annotation.column_names
        CSV.generate(headers: true) do |csv|
            csv << attributes

            all.each do |annotation|
                csv << attributes.map {|attr| annotation.send(attr)}
            end
        end
    end

    serialize :reviews, Array
    serialize :productAttributes, Array
    serialize :productDesc, Array
    serialize :QnAs, Array

    serialize :highly_relevant_reviews, Array
    serialize :highly_relevant_product_attributes, Array
    serialize :highly_relevant_descriptions, Array
    serialize :highly_relevant_qnas, Array

    serialize :partially_relevant_reviews, Array
    serialize :partially_relevant_product_attributes, Array
    serialize :partially_relevant_descriptions, Array
    serialize :partially_relevant_qnas, Array

    serialize :irrelevant_reviews, Array
    serialize :irrelevant_product_attributes, Array
    serialize :irrelevant_descriptions, Array
    serialize :irrelevant_qnas, Array

    serialize :not_sure_reviews, Array
    serialize :not_sure_product_attributes, Array
    serialize :not_sure_descriptions, Array
    serialize :not_sure_qnas, Array
    
    # serialize :externalSources, Array
    belongs_to :user, foreign_key: 'annotatorID', primary_key: 'annotatorID', optional: true

end
