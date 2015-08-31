class Pattern < ActiveRecord::Base
  belongs_to :admin, dependent: :destroy

  mount_uploader :attachment, PatternUploader

  validates :name, presence: true
  validates :admin_id, presence: true
  validates :attachment, presence: true
end
