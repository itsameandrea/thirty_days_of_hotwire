class Emails::BulkController < ApplicationController
  before_action :set_emails

  def destroy
    Email.destroy_all
    redirect_to emails_path
  end

  private

  def set_emails
    @emails = params[:all] ? Email.all : Email.where(id: params[:ids])
  end
end

