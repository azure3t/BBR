class Shoe < ActiveRecord::Base
  belongs_to :user
  has_many :orders, dependent: :destroy
  has_many :users_ordered, through: :orders, source: :user

  validates :name, :presence => true
  validates :amount, :presence => true
end
