class Repair < ActiveRecord::Base
  geocoded_by :address
  after_validation :geocode, if: :address_changed?
  belongs_to :client, class_name: 'User'
  belongs_to :saver, class_name: 'User'
end
