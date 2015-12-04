require "bcrypt"

class User < ActiveRecord::Base
  has_secure_password
  has_many :articles, through: :editors
end