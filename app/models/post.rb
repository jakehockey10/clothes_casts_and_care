class Post < ActiveRecord::Base
  default_scope { order('created_at') }
  include Bootsy::Container
  belongs_to :admin
  validates :title, presence: true, uniqueness: true
  validates :admin, presence: true
  validates :content, presence: true, uniqueness: true
end
