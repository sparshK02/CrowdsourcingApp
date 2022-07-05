class Annotation < ApplicationRecord
    serialize :reviews, Array
    serialize :productDesc, Array
    serialize :QnAs, Array
    serialize :highly_relevant, Array
    serialize :partially_relevant, Array
    belongs_to :user, foreign_key: 'annotatorID', primary_key: 'annotatorID', optional: true
end
