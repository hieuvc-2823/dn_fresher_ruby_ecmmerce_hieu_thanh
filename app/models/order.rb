class Order < ApplicationRecord
  belongs_to :user
  belongs_to :payment, optional: true
  belongs_to :address, optional: true
  has_many :order_details, dependent: :destroy
  has_many :products, through: :order_details

  before_update :check_payment_address
  enum status: {pending: 0, accept: 1, rejected: 2}

  def get_total
    total = 0
    order_details.each do |order_details|
      total += order_details.price
    end
    total
  end

  private

  def check_payment_address
    return if payment_id.present? && address_id.present?

    raise I18n.t("select_payment")
  end
end
