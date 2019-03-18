namespace :contacts  do
    desc "Send advertising email to contact list"
    task promotion_email: :environment do 
      
        Contact.where(sent: nil).each do |contact|
            AdvertisingMailer.promotion_email(contact.email).deliver_now
            puts "[EMAIL SENT] --> #{contact.email}"
            Rails.logger.debug "[EMAIL SENT] --> #{contact.email}"
            contact.sent = true
            contact.save
          end
            
          AdvertisingMailer.promotion_email("axeltaglia@gmail.com").deliver_now
          AdvertisingMailer.promotion_email("sennhauserc@gmail.com").deliver_now
    end
end