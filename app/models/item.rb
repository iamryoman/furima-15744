class Item < ApplicationRecord
  belongs_to :user
  has_one :order
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :days_to_ship
  belongs_to :prefecture
  belongs_to :shipping_charge

  # 空の投稿を保存できないようにする
  validates :item_name,
            :item_description,
            :category_id,
            :condition_id,
            :shipping_charge_id,
            :prefecture_id,
            :days_to_ship_id,
            :image,
            presence: true
  # 選択が「--」の時は保存できないようにする
  validates :category_id, :condition_id, :days_to_ship_id, :shipping_charge_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :prefecture_id, numericality: { other_than: 0 , message: "can't be blank"}
  validates :price, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 , message: "指定の範囲で入力してください"},
  format: { with: /\A[0-9]+\z/ , message: "半角数字で入力してください"}

end
