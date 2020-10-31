class User < ApplicationRecord
  has_many :tweeets
  has_many :comments
  has_one_attached :avatar # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :validatable
end
