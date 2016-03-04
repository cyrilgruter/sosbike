class Repair < ActiveRecord::Base
  # mount_uploader :photo, PhotoUploader
  CATEGORIES = ["flat tyre", "worn brakes", "broken chain"]
  geocoded_by :address
  after_validation :geocode, if: :address_changed?
  belongs_to :client, class_name: 'User', foreign_key: 'client_id'
  belongs_to :saver, class_name: 'User', foreign_key: 'saver_id'
  has_attachment :photo
  validates :client_id, presence: true
  validates :category, inclusion: {in: CATEGORIES}, presence: true

end
