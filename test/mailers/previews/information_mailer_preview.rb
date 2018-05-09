# Preview all emails at http://localhost:3000/rails/mailers/information_mailer
class InformationMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/information_mailer/thanks
  def thanks
    InformationMailer.thanks
  end

  # Preview this email at http://localhost:3000/rails/mailers/information_mailer/news
  def news
    InformationMailer.news
  end

  # Preview this email at http://localhost:3000/rails/mailers/information_mailer/welcome
  def welcome
    InformationMailer.welcome
  end

end
