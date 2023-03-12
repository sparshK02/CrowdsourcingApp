class RemoveClusterFunctionality < ActiveRecord::Migration[7.0]
  def change
    remove_column :annotations, :clusterID
    remove_column :annotations, :numOfClusterCompleted
  end
end
