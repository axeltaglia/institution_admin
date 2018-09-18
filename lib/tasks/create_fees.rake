namespace :fees  do
  desc "Creates all the fees for students subscriptions"
  task :create, [:month, :year] => :environment do |t, args|
    month = args.month
    year = args.year
    
    Student.actives.each do |student|
      if student.fees.where(month: month).empty?
        
        fee = student.fees.create!(
          year: year,
          month: month,
          amount_paid: 0,
          status: 0
        )

        total_to_pay = 0
        student.subscriptions.each do |subscription|
          total_to_pay += subscription.course.price
          fee.items.create!(
            description: subscription.course.asignature.name,
            price: subscription.course.price,
            asignature: subscription.course.asignature
          )
        end

        fee.total_to_pay = total_to_pay
        fee.save

        puts "[NEW FEE] --> #{student.full_name}: #{month}/#{year}"
      end
    end

  end
end

