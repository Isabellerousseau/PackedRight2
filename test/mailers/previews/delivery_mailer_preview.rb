# Preview all emails at http://localhost:3000/rails/mailers/delivery_mailer
class DeliveryMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/delivery_mailer/confirmation
  def confirmation
    DeliveryMailer.confirmation
  end

end
