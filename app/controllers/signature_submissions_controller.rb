class SignatureSubmissionsController < ApplicationController
  before_action :authenticate_leo!, except: [:new, :create, :welcome]
  def welcome
  end

  def new
    @signature_submission = SignatureSubmission.new
  end

  def create
    flash[:notice]= "Success"
  end

  def show
    @s = SignatureSubmission.find(params[:id])
  end
  
  def approve
    @s = SignatureSubmission.find(params[:id])
    flash.notice= I18n.t('signatures.approved', name: @s.name)
    redirect_to leo_path
  end
  def reject
    @s = SignatureSubmission.find(params[:id])
    flash.alert= I18n.t('signatures.rejected', name: @s.name)
    redirect_to leo_path
  end
  
  def index
    @type= "all";
    @signature_submissions = SignatureSubmission.where(county: current_leo.county)    
  end
  def pending    
    @type = "pending"
    @signature_submissions = SignatureSubmission.where(county: current_leo.county).pending    
    render :index
  end
  def rejected
    @type = "rejected"
    @signature_submissions = SignatureSubmission.where(county: current_leo.county).rejected    
    render :index
  end

end
