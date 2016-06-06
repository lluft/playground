class User < ActiveRecord::Base
  has_many :authentications
  include Clearance::User
end
