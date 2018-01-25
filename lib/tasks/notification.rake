namespace :notification do
  desc "Sends SMS notification to employees asking to log overtime, (if necessary)."
  task sms: :environment do
    # 1. Schedule to run at Sunday at 5PM
    # 2. Iterate over all emoployees
    # 3. Skip AdminUsers
    # 4. Send a message that has instructions and a link to log time
    # User.all.each do |user|
    #   SmsTool.send_sms()
    # No spaces or dashes in phone number
    # exactly 10 charactewrs
    # all characters have to be a number
    #
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
