class User < ActiveRecord::Base
  has_secure_password
  has_many :shoes, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_many :shoes_ordered, through: :orders, source: :shoe
  email_regex = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  validates :first_name, :presence => true
  validates :last_name, :presence => true
  validates :email, :presence => true, :format => { :with => email_regex }, :uniqueness => { :case_sensitive => false }
  validates :password, :presence => true
end