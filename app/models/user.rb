class User < ActiveRecord::Base
  # Include default custom_devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  mount_uploader :avatar, AvatarUploader

  validates :last_name, length: {minimum: 3, maximum: 42}
  validates :first_name, length: {minimum: 3, maximum: 42}
end
