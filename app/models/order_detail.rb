# == Schema Information
#
# Table name: order_details
#
#  id         :bigint           not null, primary key
#  email      :string
#  firstname  :string
#  lastname   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  address_id :bigint           not null
#  order_id   :bigint           not null
#
# Indexes
#
#  index_order_details_on_address_id  (address_id)
#  index_order_details_on_order_id    (order_id)
#
# Foreign Keys
#
#  fk_rails_...  (address_id => addresses.id)
#  fk_rails_...  (order_id => orders.id)
#
class OrderDetail < ApplicationRecord
  belongs_to :order
  belongs_to :address

  accepts_nested_attributes_for :address

  def add_details(details)
    assign_attributes(firstname: details[:firstname], lastname: details[:lastname], email: details[:email])
  end
end
