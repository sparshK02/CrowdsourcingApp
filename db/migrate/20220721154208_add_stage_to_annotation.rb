class AddStageToAnnotation < ActiveRecord::Migration[7.0]
  def change
    add_column :annotations, :formStage, :integer
  end
end
