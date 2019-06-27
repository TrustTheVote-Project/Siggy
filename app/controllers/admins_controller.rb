class AdminsController < ApplicationController
  before_action :authenticate_admin!
  def show
    @counties = I18n.t("faker.address.county")
    @user_count = 0
    @counties.each {|c| @user_count += c.size }    
  end


  def counties
    @counties = I18n.t('faker.address.county')
  end
  
  def new_county
  end
  def new_user
  end

end
