class HomeController < ApplicationController
  skip_before_action :require_login

  def show
    @contacts = Contact.all.includes(:company).page params[:page]


  end
end
