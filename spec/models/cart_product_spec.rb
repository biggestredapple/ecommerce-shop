# == Schema Information
#
# Table name: cart_products
#
#  id         :bigint           not null, primary key
#  quantity   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  cart_id    :bigint           not null
#  product_id :bigint           not null
#
# Indexes
#
#  index_cart_products_on_cart_id     (cart_id)
#  index_cart_products_on_product_id  (product_id)
#
# Foreign Keys
#
#  fk_rails_...  (cart_id => carts.id)
#  fk_rails_...  (product_id => products.id)
#
require 'rails_helper'

RSpec.describe CartProduct, type: :model do
  describe "associations" do
    it { is_expected.to belong_to(:cart) }
    it { is_expected.to belong_to(:product) }
  end

  describe "validates quantity" do
    it { is_expected.to validate_presence_of(:quantity) }
  end
end
