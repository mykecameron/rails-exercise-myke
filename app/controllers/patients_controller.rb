class PatientsController < ApplicationController
  rescue_from PatientSyncService::SyncError, with: :flash_sync_error
  
  def index
    @patients = Patient.all.order(:first_name, :last_name)
  end

  def create
    contact = Contact.find(params[:contact_id])

    patient = contact.create_patient!({
      first_name: contact.first_name,
      last_name: contact.last_name,
      avatar_url: Contact::DEFAULT_AVATAR_URL,
    })

    flash[:info] = "Created patient '#{patient.first_name} #{patient.last_name}' with Sicklie"

    redirect_to controller: :contacts, action: :index
  end

  def sync
    @patient = Patient.find(params[:id])

    PatientSyncService.new(@patient).sync

    flash[:info] = "Synced patient '#{@patient.first_name} #{@patient.last_name}' with Sicklie"
    redirect_to action: :index
  end

  private

  def flash_sync_error(error)
    flash[:danger] = error.message
    redirect_to action: :index
  end
end
