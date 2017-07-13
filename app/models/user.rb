class User < ApplicationRecord
  has_many :posts
  
  validates :username, presence: true, uniqueness: true
  validates :name, presence: true
  validates :lastname, presence: true

  def fullname
    name + ' ' + lastname # esto es para no estar concatenando name y lastname
  end

end
