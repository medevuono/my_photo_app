class PostMailer < ApplicationMailer
  # aqui puedo controlar las acciones de correo que quiero hacer
  def post_published(post)
    @post = post
    @user = post.user
    mail(to: @user.email, subject: 'Your super post has been published')
  end
end
