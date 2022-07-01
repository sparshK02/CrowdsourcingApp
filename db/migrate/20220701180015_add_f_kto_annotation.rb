class AddFKtoAnnotation < ActiveRecord::Migration[7.0]
  def change
    add_foreign_key :annotations, :users, column: :annotatorID, primary_key: :annotatorID
  end
end
