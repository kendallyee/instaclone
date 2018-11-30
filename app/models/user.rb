class User < ApplicationRecord

  validates :email, :format => { :with => /\w+[@]\w+[.]\w{1}\w+/}, uniqueness: true, :presence => true
  validates :password, presence: true

  has_secure_password

  has_many :authentications, dependent: :destroy

end
