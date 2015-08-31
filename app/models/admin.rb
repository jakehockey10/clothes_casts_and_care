class Admin < ActiveRecord::Base
  devise :database_authenticatable, :trackable, :timeoutable, :lockable
  has_many :posts, dependent: :destroy
  has_many :patterns, dependent: :destroy
end
