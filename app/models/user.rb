class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_and_belongs_to_many :variants
  has_many :orders
  devise :database_authenticatable, 
         :recoverable, :rememberable, :trackable, :validatable, :registerable,
         :omniauthable, :omniauth_providers => [:facebook]
  def admin?
    self.role == 'admin'
  end
end
