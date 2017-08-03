class Post < ApplicationRecord
  belongs_to :user
  has_many :comments

  validates :description, presence: true
  has_attached_file :photo, styles: {}, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :photo, content_type: /\Aimage\/.*\z/
  validates_attachment_presence :photo
  #validate :tittle, length: {

  #}
  #validate :count, numericality: {only_integer: true},

  # loqe va despues de -> parametro es un landa 
  #estoy ingresando en un simbolo yesterday el fragmento de codigo que se va a invocar cuando se llame yesterday
  #scope :yesterday, (days) <- esto seria un paremetro
  scope :yesterday, -> { where('created_at < ?', 1.days.ago) }
  
  after_create do |post| # esto es un hook
    #logger.info "An email was sent to #{post.user.email}"
    #PostMailer.post_published(post).deliver_now
  end

end
