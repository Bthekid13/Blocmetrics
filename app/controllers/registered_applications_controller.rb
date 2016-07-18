class RegisteredApplicationsController < ApplicationController


  def show
    @reg_app = RegisteredApplication.find(params[:id])
    @events = @reg_app.events.group_by(&:name)
  end

  def edit
    @reg_app = RegisteredApplication.find(params[:id])
  end

  def new
    @reg_app = RegisteredApplication.new
  end

  def create
    @reg_app = RegisteredApplication.new(app_params)
    @reg_app.user = current_user

    if @reg_app.save
      flash[:notice] = "Application Registered"
      redirect_to @reg_app
    else
      flash.now[:alert] = "Something went wrong. Please try again."
      render :new
    end
  end

  def update
    @reg_app = RegisteredApplication.find(params[:id])
    @reg_app.assign_attributes(app_params)

    if @reg_app.save
      flash[:notice] = "Application Updated"
      redirect_to @reg_app
    else
      flash[:notice] = "Something went wrong. Please try again."
      render :edit
    end
  end

  def destroy
    @reg_app = RegisteredApplication.find(params[:id])

    if @reg_app.destroy
      flash[:notice] = "Application Deleted"
      redirect_to root_path
    else
      flash[:notice] = "Something went wrong. Please try again."
      redirect_to request.referrer
    end
  end

private

  def app_params
    params.require(:registered_application).permit(:name, :url)
  end
end
