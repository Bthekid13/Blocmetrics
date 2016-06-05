class API::EventsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_filter :set_access_control_headers


  def create
    registered_application = RegisteredApplication.find_by(url: request.env['HTTP_ORIGIN'])

    if registered_application.nil?
      render json: { error: "Unregistered application" }, status: :unprocessable_entity
    else
      @event = registered_application.events.build( event_params )
      if @event.save
        render json: @event, status: :created
      else
        render json: { error: @event.errors }, status: :unprocessable_entity
      end
    end
  end

  def preflight
    head 200
  end

  def set_access_control_headers
    #Allow requests from any origin
    headers['Access-Control-Allow-Origin'] = '*'
    #Permit POST GET OPTIONS request methods
    headers['Access-Control-Allow-Methods'] = 'POST, GET, OPTIONS'
    # Allows the header 'Content-Type' to declare the type of data being sent
    headers['Access-Control-Allow-Headers'] = 'Content-Type'
  end

  private

  def event_params
    params.require(:event).permit(:name)
  end
end
