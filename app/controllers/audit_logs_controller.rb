class AuditLogsController < ApplicationController
  def index
    @audit_logs = AuditLog.page(params[:page]).per(10)
    authorize @audit_logs
    #important to have this order like so, authorize second
  end
end
