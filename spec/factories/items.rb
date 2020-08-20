FactoryBot.define do
  factory :item do
    user_id               {1}
    name                  {"パンツ"}
    introduction      {"メンズパンツです"}
    category
    condition_id          {1}
    postagepayer_id       {1}
    postagetype_id        {1}
    prefecture_id         {2}
    brand_id              {1}
    sellstatus_id         {1}
    preparationdays_id       {1}
    price               {1000}
    saler_id              {1}
    after(:build) do |item|
      item.images << build(:image, item: item)
    end
    user
  end
end