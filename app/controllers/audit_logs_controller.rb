class AuditLogsController < ApplicationController
  def index
    @audit_logs = AuditLog.all
    authorize @audit_logs
    #important to have this order like so, authorize second
  end
end
