class AddClusterAndCountToAnnotation < ActiveRecord::Migration[7.0]
  def change
    add_column :annotations, :clusterID, :integer
    add_column :annotations, :numOfClusterCompleted, :integer, default: 0
  end
end
