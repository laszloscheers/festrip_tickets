class TicketMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.ticket_mailer.new_ticket.subject
  #
  def new_ticket(ticket)
    @ticket = ticket

    mail to: @ticket[2],
         subject: "Your ticket from Festrip"
  end
end
