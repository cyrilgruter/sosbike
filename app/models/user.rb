class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :problems, class_name: 'Repair', foreign_key: 'client_id'
  has_many :missions, class_name: 'Repair', foreign_key: 'saver_id'
  has_many :reviews
  has_attachment :photo
  validates :first_name, presence: true
  #validates :phone, format: { with: /\A((\+|00)33\s?|0)[1-9](\s?\d{2}){4}\Z/,
  #                             message: "wrong phone number format"}
end
