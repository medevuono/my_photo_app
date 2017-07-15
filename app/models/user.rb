class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, # estos son los comportamientos de divice que se estan usando
         :confirmable
         has_many :posts
  
  validates :username, presence: true, uniqueness: true
  validates :name, presence: true
  validates :lastname, presence: true

  def fullname
    name + ' ' + lastname # esto es para no estar concatenando name y lastname
  end

end
