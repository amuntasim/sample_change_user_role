class AddViewsCountToUsers < ActiveRecord::Migration
  def change
    add_column :users, :views_count, :integer
  end
end
