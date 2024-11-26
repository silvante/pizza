class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :mobile, presence: true
  validates :name, presence: true
  validates :born_in, presence: true

  private

  def set_default_status
    self.status ||= "active" # Assign default only if the field is nil
  end

  has_many :order
end
