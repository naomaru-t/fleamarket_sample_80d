class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.timestamps
      t.string :name,                               null: false
      t.text :introduction,                         null: false
      t.references :user,                           null: false, foreign_key: true
      t.integer :condition_id,                      null: false
      t.integer :postagepayer_id,                   null: false
      t.integer :postagetype_id,                    null: false
      t.integer :prefecture_id,                     null: false
      t.integer :preparationdays_id,                null: false
      t.integer :sellstatus_id,                     null: false
      t.integer :price,                             null: false
      t.integer :category_id,                       null: false
      t.integer :brand_id
      t.integer :buyer_id
      t.references :saler, foreign_key: { to_table: :users }, null: false
      # user関連はログイン機能実装後調整します
    end
  end
end
