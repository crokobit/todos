class User < ActiveRecord::Base
  has_many :todos
  has_secure_password validations: false
end
