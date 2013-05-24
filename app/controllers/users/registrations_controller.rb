class Users::RegistrationsController < Devise::RegistrationsController
  before_filter :check_permissions, :only => [:new, :create, :cancel]
  skip_before_filter :require_no_authentication
 

  def new
  	super
  end

  def update
  	super
  end

  def create
  	@user = User.new(params[:user], :as => :newuser)
    if @user.save
      sign_in @user
      flash[:notice] = "Welcome to the Mosaic db!"
      redirect_to root_path
    else
      respond_with resource
    end


  end


  def check_permissions
    authorize! :create, resource
  end
end