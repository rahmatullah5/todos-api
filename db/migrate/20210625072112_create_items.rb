class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name
      t.boolean :done
      t.references :todo

      t.timestamps
    end
  end
end
