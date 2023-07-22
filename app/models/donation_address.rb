class DonationAddress
  include ActiveModel::Model 
  attr_accessor :user_id, :item_id, :post_code, :prefecture_id, :municipality, :address, :building, :telephone_number

  validates :user_id, presence: true
  validates :item_id, presence: true
  validates :post_code, presence: true, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
  validates :prefecture_id, presence: true
  validates :municipality, presence: true
  validates :address, presence: true
  # 建物名は任意
  validates :telephone_number, presence: true


  def save
    order = Order.create(user_id: user_id, item_id:item_id)
    Address.create(post_code: post_code, prefecture_id: prefecture_id, municipality: municipality, address: address, building: building, telephone_number: telephone_number, order_id: order.id)
  end

end