class OutsideController < ApplicationController
  def test

    render json:
      {
          "/mtls/test": JSON.parse(HTTParty.get("#{ENV['REMOTE_HOST']}/mtls/test").body),
          "/mtls/delegate": JSON.parse(HTTParty.get("#{ENV['REMOTE_HOST']}/mtls/delegate").body),
          "/mtls/callback": JSON.parse(HTTParty.get("#{ENV['REMOTE_HOST']}/mtls/callback").body)
      }
  end
end
