class AddCategoryToIdeas < ActiveRecord::Migration
  def change
    add_column :ideas, :category_id, :integer
  end
end
