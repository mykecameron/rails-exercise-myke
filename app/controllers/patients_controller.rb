class PatientsController < ApplicationController
  def index
    @patients = Patient.all.order(:first_name, :last_name)
  end

  def sync
    @patient = Patient.find(params[:id])

    PatientSyncService.new(@patient).sync

    flash[:info] = "Synced patient '#{@patient.first_name} #{@patient.last_name}' with Sicklie"
    redirect_to action: :index
  end
end
