class CreateInterests < ActiveRecord::Migration
  def change
    create_table :interests do |t|
      t.string :user
      t.references :project
      t.timestamps
    end
  end
end
