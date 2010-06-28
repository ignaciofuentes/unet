# new file app/controllers/activations_controller.rb
class ActivationsController < ApplicationController
  skip_before_filter :require_user, :only => [:new, :create]

  def new
    @user = User.find_using_perishable_token(params[:activation_code], 1.week) || (raise Exception)
    raise Exception if @user.active?
  end

  def create
    @user = User.find(params[:id])

    raise Exception if @user.active?

    if @user.activate!
      @user.deliver_activation_confirmation!
      flash[:notice] = "Su cuenta ha sido activada"
      redirect_to root_url
    else
      render :action => :new
    end
  end

end
