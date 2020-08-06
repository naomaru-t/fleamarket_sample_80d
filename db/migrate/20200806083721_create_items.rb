class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.timestamps
      t.string :name,                               null: false
      t.text :introduction,                         null: false
      t.references :user,     foreign_key: true,    null: false
      t.string :condition,                          null: false
      t.string :postage_payer,                      null: false
      t.string :preparation_days,                   null: false
      t.integer :price,                             null: false
    end
  end
end
