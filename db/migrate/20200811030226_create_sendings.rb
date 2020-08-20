class CreateSendings < ActiveRecord::Migration[6.0]
  def change
    create_table :sendings do |t|

      t.timestamps
      t.string :first_name,                         null: false
      t.string :family_name,                        null: false
      t.string :first_name_kana,                    null: false
      t.string :family_name_kana,                   null: false
      t.integer :post_code,                         null: false
      t.integer :prefecture_id,                     null: false
      t.string :city,                               null: false
      t.string :house_number,                       null: false
      t.string :building_name
      t.references :user, foreign_key: true,        null: false
    end
  end
end
