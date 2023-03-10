class ProfilesController < ApplicationController
  def index
    @jobs = Job.all
    @specializations = params[:job].present? ? Specialization.where(job_id: params[:job]) : []
  end
end
