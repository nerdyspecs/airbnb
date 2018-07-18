class ReservationJob < ActiveJob::Base
  queue_as :default

  def perform(*args)
    ReservationMailer.reservation_email(args[0],args[1],args[2]).deliver_later
    ReservationMailer.listing_email(args[0],args[1],args[2]).deliver_later
  end
end