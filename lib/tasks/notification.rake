namespace :notification do
  desc "Sends SMS notification to employees asking to log overtime, (if necessary)."
  task sms: :environment do
   if Time.now.sunday?
     employees = Employee.all
     notifcation_message = "Please log into the overtime management dashboard to request overtime or confirm your hours for last week: #{request.domain}"

     employees.each do |employee|
       AuditLog.create!(user_id: employee.id, start_date:
       SmsTool.send_sms(number: employee.phone, message: notifcation_message)
     end
   end
  end

  desc "Sends mail notifications to managers (admin users) each day to inform of pending overtime requests"
  task manager_email: :environment do
    puts "Im in the manager email"

    submitted_posts = Post.submitted
    admin_users= AdminUser.all
    if submitted_posts.count > 0
       admin_users.each do |admin|
         ManagerMailer.email(admin).deliver_later
       end
    end
  end

end
