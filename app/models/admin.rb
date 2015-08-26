class Admin < ActiveRecord::Base
  devise :database_authenticatable, :trackable, :timeoutable, :lockable
  has_many :posts
end
