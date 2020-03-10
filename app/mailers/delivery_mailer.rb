class DeliveryMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.delivery_mailer.confirmation.subject
  #
  def confirmation
    @delivery = Delivery.find params[:delivery_id]
    @order = @delivery.order

    @greeting = "Hi"

    mail to: "to@example.org"
  end
end
