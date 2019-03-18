namespace :fees  do
  desc "Creates all the fees for students subscriptions"
  task :create, [:month, :year] => :environment do |t, args|
    month = args.month
    year = args.year
    
    Student.actives.each do |student|
      puts "[Checking student] --> #{student.full_name}"
      if student.fees.where(month: month).empty?
        
        fee = student.fees.create!(
          year: year,
          month: month,
          amount_paid: 0,
          status: 0
        )

        total_to_pay = 0
        subscriptions = 
          student.subscriptions
            .where(status: 1)

        subscriptions.each do |subscription|
          total_to_pay += subscription.price
          fee.items.create!(
            asignature_name: subscription.asignature.name,
            subscription_price: subscription.price,
            day: subscription.day.name,
            start_at: subscription.start_at.str_time,
            end_at: subscription.end_at.str_time,
            classroom: subscription.classroom.name
          )
        end

        fee.total_to_pay = total_to_pay
        fee.save

        puts "[NEW FEE] --> #{student.full_name}: #{month}/#{year}"
      end
    end

  end
end

