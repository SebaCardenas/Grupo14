class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :reviews
  has_many :articles
  has_many :children
  
  def admin?
         self.role. == "admin"
  end

  def common?
         self.role. == "common"
  end

  def child?
         self.role. == "child"
  end
  
end


