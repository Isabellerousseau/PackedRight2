class DeliveryMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.delivery_mailer.confirmation.subject
  #
  def confirmation
    @order = Order.find params[:order_id]

    @greeting = "Hi"

    mail to: "to@example.org"
  end
end
