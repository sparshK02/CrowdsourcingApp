# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

data = ActiveSupport::JSON.decode(File.read("db/data_for_annotation_0131.json"))
#data = data[0] # Unwrap the Array

data.each do |i|
    Annotation.create(
    product: i["product_name"],
    itemID: i["item_id"],
    question: i["question"],
    reviews: i["top_reviews"],
    productAttributes: i["top_attributes"],
    productDesc: i["top_descriptions"],
    QnAs: i["top_qna"]
    )
    end
end

