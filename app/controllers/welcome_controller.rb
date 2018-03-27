class WelcomeController < ApplicationController
  def index
    @countries = Declaration.limit(50).where.not(country_name: '').group(:country_name).order('count(*) DESC').pluck(:country_name)
  end

  def add
    if Rails.env.development?
      # Fake IP address in development because otherwise 127.0.0.1
     # ip_address = Faker::Internet.ip_v4_address
   # else
      ip_address = request.remote_ip
    end

    response = RestClient.get("https://freegeoip.net/json/#{ip_address}")
    response_object = JSON.load(response)

  #  ipp = Declaration.find_by ip_address: response_object.fetch('ip')
  #  if Declaration.exists?(ip_address: response_object.fetch('ip'))
    @dec = Declaration.create!(
      ip_address: response_object.fetch('ip'),
      city: response_object.fetch('city'),
      country_name: response_object.fetch('country_name'),
      country_code: response_object.fetch('country_code'),
      latitude: response_object.fetch('latitude'),
      longitude: response_object.fetch('longitude'),
      time_zone: response_object.fetch('time_zone')
    )

    render json: {clicks: Declaration.count, location: @dec.latitude + "," + @dec.longitude}
  end
end
