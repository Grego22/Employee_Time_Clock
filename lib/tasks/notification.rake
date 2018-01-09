namespace :notification do
  desc "Sends SMS notification to employees asking to log overtime, (if necessary)."
  task sms: :environment do
    puts "I have a rake task"
  end

end
