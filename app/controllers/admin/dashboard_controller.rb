module Admin
    class DashboardController < Admin::BaseController

      # GET /dashboard
      def index
      end

      def send_promotion_email
        Contact.where(sent: nil).each do |contact|
          AdvertisingMailer.promotion_email(contact.email).deliver_now
          puts "[EMAIL SENT] --> #{contact.email}"
          Rails.logger.debug "[EMAIL SENT] --> #{contact.email}"
          contact.sent = true
          contact.save
        end
          
        AdvertisingMailer.promotion_email("axeltaglia@gmail.com").deliver_now
        AdvertisingMailer.promotion_email("sennhauserc@gmail.com").deliver_now

        format.html { redirect_to admin_dashboard_url, notice: "Email enviados exitosamente" }
      end
  
  end
end