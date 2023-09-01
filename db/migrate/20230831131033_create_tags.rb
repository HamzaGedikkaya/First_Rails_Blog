class CreateTags < ActiveRecord::Migration[7.0]
  def change
    create_table :tags do |t|
      t.string :name

      t.timestamps
    end

    add_column :articles, :tag_id, :integer, index: true, null: true
  end
end
