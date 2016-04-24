class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  validates :email, presence: true
  validates :email, uniqueness: true
  validates :password, presence: true
  validates :password, confirmation: true

  extend OmniauthCallbacks

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable
  has_many :orders
  belongs_to :county
  belongs_to :township

  def admin?
    is_admin
  end

  def to_admin
    self.update_columns(is_admin: true)
  end

  def to_normal
    self.update_columns(is_admin: false)
  end

  def update_current_user_data(billing_name, billing_address, billing_county_id, billing_township_id)
    self.find_by(id: current_user.id)
    self.update_columns(billing_name: billing_name, billing_address: billing_address, name:billing_name,
                        billing_county_id: billing_county_id, billing_township_id: billing_township_id)
  end

  def county
    County.find(self.billing_county_id)
  end

  def township
    Township.find(self.billing_township_id)
  end

  def zip_code
    township.zip_code
  end

  def full_address
    zip_code + township.county.name + township.name
  end
end
