class HomeController < ApplicationController
  skip_before_action :require_login

  def show
    # @contacts = Contact.all.includes(:company).page params[:page]
    @contacts_by_company = Contact.contacts_by_company


  end
end
