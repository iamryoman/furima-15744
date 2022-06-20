class OrderAddress
  include ActiveModel::Model
  attr_accessor :postal_code,
                :prefecture_id,
                :municipalities,
                :address,
                :building_name,
                :telephone_number,
                :purchase_history,
                :user_id,
                :item_id,
                :token

  with_options presence: true do
    validates :postal_code,
              :prefecture_id,
              :municipalities,
              :address

    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :telephone_number, format: {with: /\A\d{10,11}\z/, message: "is invalid. Include hyphen(-)"}
  end
  validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank" }
  # tokenga空の投稿を保存できないようにする
  validates :token, presence: true

  def save
    # 品と購入者の情報
    order = PurchaseHistory.create(user_id: user_id, item_id: item_id)
    # 住所などを保存する
    Order.create(
      postal_code: postal_code,
      prefecture_id: prefecture_id,
      municipalities: municipalities,
      address: address,
      building_name: building_name,
      telephone_number: telephone_number,
      purchase_history_id: order.id
    )
  end

end

