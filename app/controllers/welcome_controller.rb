class WelcomeController < ApplicationController
  skip_before_action :verify_authenticity_token, only: :contact
  layout false

  def index
    @style = Rails.env.development? ? Rails.application.assets['welcome'].to_s : File.read(Rails.root.join('public/assets/' + Rails.application.assets_manifest.assets["welcome.css"]))
  end

  def contact
    Request.notify(params[:contact]).deliver_now
    response.set_header("AMP-Access-Control-Allow-Source-Origin", request.protocol + request.host_with_port)
    render json: {}, status: 200
  end
end
