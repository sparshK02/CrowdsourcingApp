class Annotation < ApplicationRecord
    serialize :reviews, Array
    serialize :productAttributes, Array
    serialize :QnAs, Array
    serialize :highly_relevant, Array
    serialize :partially_relevant, Array
    serialize :irrelevant, Array
    serialize :notSure, Array
    # serialize :externalSources, Array
    serialize :productDesc, Array
    belongs_to :user, foreign_key: 'annotatorID', primary_key: 'annotatorID', optional: true
end
