class Repair < ActiveRecord::Base
  belongs_to :client, class_name: 'User'
  belongs_to :saver, class_name: 'User'
end
