class AddActiveToArticle < ActiveRecord::Migration[7.0]
  def change
    add_column :articles, :active, :boolean, default: false
  end
end
