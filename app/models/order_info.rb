class OrderInfo < ActiveRecord::Base
  belongs_to :order
  belongs_to :county
  belongs_to :township
  has_one :county
  has_one :township
  validates :billing_name, presence: true
  validates :billing_address, presence: true

  def county
    County.find(self.billing_county_id)
  end

  def township
    Township.find(self.billing_township_id)
  end

  def zip_code
    township.zip_code
  end

  def full_billing_address
    zip_code + township.county.name + township.name + self.billing_address
  end
end
