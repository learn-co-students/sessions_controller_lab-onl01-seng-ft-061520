class SessionsController < ApplicationController
  def new; end

  def create
    # binding.pry
    if params[:name].nil? || params[:name].empty?
      # if what is before the & is nil , then it will return nil without calling method
      redirect_to '/login'
    else
      session[:name] = params[:name]
      redirect_to '/'
    end
  end

  def destroy
    session.delete :name
    redirect_to '/'
  end

  private

  def name_params
    params.require(:name).permit(:name)
  end
end
