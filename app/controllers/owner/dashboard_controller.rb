include ActionView::Helpers::NumberHelper

module Owner
    class DashboardController < Owner::BaseController
  
      # GET /dashboard
      def index
        @active_suscriptions = Subscription.actives.count
        @current_year = Time.now.year
        @current_month = Time.now.month
        @generated_items_fees_count = Item.joins(:fee).where("fees.month = #{@current_month}").count
        @total_payed = Fee.where(month: @current_month).payed.count
        if @generated_items_fees_count > 0
          @fee_payed_percentaje = number_with_precision((@total_payed.to_f / @generated_items_fees_count.to_f) * 100, :precision => 2)
        else
          @fee_payed_percentaje = 0
        end


      end

      
  
  end
end