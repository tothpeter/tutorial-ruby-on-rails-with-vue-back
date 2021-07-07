class User < ApplicationRecord
  has_secure_password

  has_many :artists, dependent: :destroy
  has_many :records, dependent: :destroy
end
