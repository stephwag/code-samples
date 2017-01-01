module Concerns::Geocode
  extend ActiveSupport::Concern

  included do
    geocoded_by :provided_address  # can also be an IP address
    after_validation :geocode          # auto-fetch coordinates

    reverse_geocoded_by :latitude, :longitude
    after_validation :reverse_geocode  # auto-fetch addressr
  end

  def coordinates
    [latitude, longitude]
  end

  def provided_address
    if address.blank?
      ip_address
    else
      address
    end
  end
end