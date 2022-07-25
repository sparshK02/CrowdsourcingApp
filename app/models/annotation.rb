class Annotation < ApplicationRecord
    serialize :reviews, Array
    serialize :productAttributes, Array
    serialize :QnAs, Array

    serialize :highly_relevant_reviews, Array
    serialize :highly_relevant_product_attributes, Array
    serialize :highly_relevant_qnas, Array

    serialize :partially_relevant_reviews, Array
    serialize :partially_relevant_product_attributes, Array
    serialize :partially_relevant_qnas, Array

    serialize :irrelevant_reviews, Array
    serialize :irrelevant_product_attributes, Array
    serialize :irrelevant_qnas, Array

    serialize :not_sure_reviews, Array
    serialize :not_sure_product_attributes, Array
    serialize :not_sure_qnas, Array
    
    # serialize :externalSources, Array
    serialize :productDesc, Array
    belongs_to :user, foreign_key: 'annotatorID', primary_key: 'annotatorID', optional: true
end
