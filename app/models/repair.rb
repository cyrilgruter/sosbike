class Repair < ActiveRecord::Base
  CATEGORIES = ["Flat tire", "Worn brakes", "Broken chain"]
  geocoded_by :address
  after_validation :geocode, if: :address_changed?
  belongs_to :client, class_name: 'User'
  belongs_to :saver, class_name: 'User'
  has_attachment :photo
  validates :client_id, presence: true
  validates :category, inclusion: {in: CATEGORIES}, presence: true
end
