require "rails_helper"

RSpec.describe PatientsController, type: :controller do
  describe "PUT sync" do
    let(:patient_sicklie_id) { SecureRandom.uuid }
    let(:patient) { FactoryBot.create(:patient, sicklie_id: patient_sicklie_id) }

    let(:mock_patient_sync_service) { instance_double(PatientSyncService, sync: nil) }

    before do
      allow(PatientSyncService).to receive(:new).with(patient).and_return mock_patient_sync_service
    end

    it "adds an info flash to indicate success" do
      put :sync, params: { id: patient.id }

      expect(flash[:info]).to match "Synced patient '#{patient.first_name} #{patient.last_name}' with Sicklie"
        expect(response).to redirect_to patients_path
    end

    context "there is an error syncing with Sicklie" do
      let(:error) { PatientSyncService::SyncError.new("There was an error") }

      before do
        allow(mock_patient_sync_service).to receive(:sync).and_raise error
      end

      it "adds an error flash to indicate the error" do
        put :sync, params: { id: patient.id }

        expect(flash[:danger]).to match "Error syncing with Sicklie: There was an error"
        expect(response).to redirect_to patients_path
      end
    end
  end
end