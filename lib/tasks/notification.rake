namespace :notification do
  desc "Sends SMS notification to employees asking to log overtime, (if necessary)."
  task sms: :environment do
    # 1. Schedule to run at Sunday at 5PM
    # 2. Iterate over all emoployees
    # 3. Skip AdminUsers
    # 4. Send a message that has instructions and a link to log time
    puts "I have a rake task"
  end

end
