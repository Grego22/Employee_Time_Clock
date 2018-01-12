require 'rails_helper'

describe 'AuditLog Feature' do
  describe 'index' do
    before do
      admin_user = FactoryBotRails.create(:admin_user)
      login_as(admin_user, :scope => admin_user)
      FactoryBotRails.create(:admin_user)
    end

    it 'has an index page that can be reached'
      visit audit_logs_path
      expect(page.status_code)


    it "renders audit log content" do
      FactoryBotRails.create(:audit_log)
      visit audit_logs_path
      expect(page).to have_content(/Snow/)
    end

    it 'cannot be accessed by non admin users' do
      logout(:user)
      user = FactoryBotRails.create(:user)
      login_as(user, :scope => :user)

      visit audit_logs_path

      expect(current_path).to eq(root_path)
    end
  end
end