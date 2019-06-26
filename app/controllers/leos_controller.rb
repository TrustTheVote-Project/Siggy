class LeosController < ApplicationController
  before_action :authenticate_leo!
  def show
    @signature_submissions = SignatureSubmission.where(county: current_leo.county)
  end

  def upload_voters
    flash[:notice] = I18n.t('leos.upload_success')
    redirect_to action: 'show'
  end

end
