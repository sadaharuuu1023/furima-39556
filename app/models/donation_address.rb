class DonationAddress
  include ActiveModel::Model 
  attr_accessor :user_id, :item_id, :post_code, :prefecture_id, :municipality, :address, :building, :telephone_number, :token

  with_options presence: true do
  validates :user_id
  validates :item_id
  validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
  validates :prefecture_id
  validates :municipality
  validates :address
  # 建物名は任意
  validates :telephone_number, format: { with: /\A\d{10,11}\z/, message: 'Invalid. Please enter only digits in half-width characters.'}
  

  # validates :telephone_number, format: { with: /\A\d{10,11}\z/, message: 'Invalid. Please enter only digits in half-width characters.' }
  validates :token
  end
  validates :prefecture_id, numericality: {other_than: 0, message: "can't be blank"}


  def save
    order = Order.create(user_id: user_id, item_id:item_id)
    Address.create(post_code: post_code, prefecture_id: prefecture_id, municipality: municipality, address: address, building: building, telephone_number: telephone_number, order_id: order.id)
  end

end