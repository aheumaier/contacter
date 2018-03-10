# app/helpers/form_helper.rb
module FormHelper
  def setup_company(company)
    company.addresses ||= Address.new
  end
end