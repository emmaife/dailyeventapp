class CreateUserNeighborhoods < ActiveRecord::Migration
  def change
    create_table :user_neighborhoods do |t|
      t.references :user, index: true
      t.references :neighborhood, index: true

      t.timestamps
    end
  end
end
