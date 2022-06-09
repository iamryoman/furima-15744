class Order < ApplicationRecord
  belongs_to :purchase_history


  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture

  # 空の投稿を保存できないようにする
  validates :postal_code,
            :prefecture_id,
            :municipalities,
            :address,
            :telephone_number,
            :purchase_history,
            presence: true
  # 選択が「--」の時は保存できないようにする
  validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank" }
end
