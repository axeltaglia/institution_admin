namespace :contacts  do
    desc "Send advertising email to contact list"
    task :promotion_email => :environment do |t|
      
      AdvertisingMailer.promotion_email("axeltaglia@gmail.com").deliver_now
      AdvertisingMailer.promotion_email("sennhauserc@gmail.com").deliver_now

      #Contact.each do |contact|
        #  AdvertisingMailer.receipt_email(fee, "axeltaglia@gmail.com").deliver_now
        #  puts "[EMAIL SENT] --> #{contact.email}"
        #end
      #end
  
    end
  end
  
  