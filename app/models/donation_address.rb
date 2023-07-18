class DonationAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :post_code, :prefecture_id, :municipality, :address, :building, :telephone_number

  validates :user_id, presence: true
  validates :item_id, presence: true
  validates :post_code, presence: true
  validates :prefecture_id, presence: true
  validates :municipality, presence: true
  validates :address, presence: true
  # 建物名は任意
  validates :telephone_number, presence: true
end

  def save
    # orderをアドレステーブルに保存する場合
    # order = Order.create(user_id: user_id, item_id: item_id)
    Order.create(user_id,item_id)
    Address.create(post_code,prefecture_id,municipality,address,building,telephone_number)
  end
