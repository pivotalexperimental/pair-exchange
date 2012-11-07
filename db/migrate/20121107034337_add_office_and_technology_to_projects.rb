class AddOfficeAndTechnologyToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :office, :string
    add_column :projects, :technology, :string
  end
end
