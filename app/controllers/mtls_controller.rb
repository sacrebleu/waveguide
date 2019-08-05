class MtlsController < ApplicationController
  # $myhost = "https://istio.dev.nexmo.cloud"

  def test

    render json: {
        request: request.path,
        ssl: request.ssl?
    }

  end

  def delegate
    render json: HTTParty.get("http://waveguide.nexmo:3000/mtls/test").body
  end

  def callback
    render json: HTTParty.get("http://waveguide.nexmo:3000/mtls/delegate").body
  end
end
