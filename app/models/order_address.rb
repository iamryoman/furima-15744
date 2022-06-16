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
                :token,
                :price

  with_options presence: true do
    validates :price, numericality: {only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 1000000, message: 'is invalid'}
    validates :postal_code,
              :prefecture_id,
              :municipalities,
              :address,
              :purchase_history,
              :user_id,
              :item_id
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :telephone_number, format: {with: /\A\d{10,11}\z/, message: "is invalid. Include hyphen(-)"}
  end
  validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank" }

  def save
    # 住所などを保存する
    order = Order.create(
      postal_code: postal_code,
      prefecture_id: prefecture_id,
      municipalities: municipalities,
      address: address,
      building_name: building_name,
      telephone_number: telephone_number,
      purchase_history_id: purchase_history.id
    )
    # 品と購入者の情報
    PurchaseHistory.create(user_id: current_user.id, item_id: @item.id)
  end

end
