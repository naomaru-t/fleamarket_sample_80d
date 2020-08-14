class Postagetype < ActiveHash::Base
  self.data = [ {id: 0, name: '-----↓送料込み（出品者負担）を選んだ方↓-----'},
    {id: 1, name: '未定'}, {id: 2, name: 'らくらくメルカリ便'}, {id: 3, name: 'ゆうゆうメルカリ便'},
    {id: 4, name: 'ゆうメール'}, {id: 5, name: 'レターパック'}, {id: 6, name: '普通郵便（定形、定形外'},
    {id: 7, name: 'クロネコヤマト'}, {id: 8, name: 'ゆうパック'}, {id: 9, name: 'クリックポスト'},
    {id: 10, name: 'ゆうパケット'}, {id: 11, name: '-----↑送料込み（出品者負担）選んだ方↑-----'}, {id: 12, name: '-----↓着払い（購入者負担）を選んだ方↓-----'},
    {id: 13, name: '未定'}, {id: 14, name: 'ゆうメール'},{id: 15, name: 'ゆうパック'},
    {id: 16, name: 'クロネコヤマト'},{id: 17, name: '-----↑着払い（購入者負担）を選んだ方↑-----'}
  ]
  include ActiveHash::Associations
  has_many :items
end
