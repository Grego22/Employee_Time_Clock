require 'rails_helper'

RSpec.describe AuditLog, type: :model do
  before do
    @audit_log = FactoryBotRails.create(:audit_log)
  end

  describe creation do
    it "can be properly created" do
      expect(@audit_log).to be_valid
    end

  end
end
