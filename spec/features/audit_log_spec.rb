require 'rails_helper'

describe 'AuditLog Feature' do
  let (:audit_log){FactoryBotRails.create(:audit_log)}

  describe 'index' do
    it 'has an index page that can be reached'
      visit audit_logs_path
      expect(page.status_code)


    it "renders audit log content" do
      visit audit_logs_path
      expect(page).to have_content
    end
  end
end