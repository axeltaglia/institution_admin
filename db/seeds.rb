require 'active_support'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
#user = CreateAdminService.new.call
#puts 'CREATED ADMIN USER: ' << user.email
# Environment variables (ENV['...']) can be set in the file .env file.


# Days of Week
Day.find_or_create_by!(:name => "Domingo", :number => 0)
Day.find_or_create_by!(:name => "Lunes", :number => 1)
Day.find_or_create_by!(:name => "Martes", :number => 2)
Day.find_or_create_by!(:name => "Miércoles", :number => 3)
Day.find_or_create_by!(:name => "Jueves", :number => 4)
Day.find_or_create_by!(:name => "Viernes", :number => 5)
Day.find_or_create_by!(:name => "Sábado", :number => 6)

# Hours
Hour.find_or_create_by!(:str_time => "15:00", :seconds_since_midnight => Time.parse("15:00").seconds_since_midnight.to_i)
Hour.find_or_create_by!(:str_time => "15:30", :seconds_since_midnight => Time.parse("15:30").seconds_since_midnight.to_i)
Hour.find_or_create_by!(:str_time => "16:00", :seconds_since_midnight => Time.parse("16:00").seconds_since_midnight.to_i)
Hour.find_or_create_by!(:str_time => "16:30", :seconds_since_midnight => Time.parse("16:30").seconds_since_midnight.to_i)
Hour.find_or_create_by!(:str_time => "17:00", :seconds_since_midnight => Time.parse("17:00").seconds_since_midnight.to_i)
Hour.find_or_create_by!(:str_time => "17:30", :seconds_since_midnight => Time.parse("17:30").seconds_since_midnight.to_i)
Hour.find_or_create_by!(:str_time => "18:00", :seconds_since_midnight => Time.parse("18:00").seconds_since_midnight.to_i)
Hour.find_or_create_by!(:str_time => "18:30", :seconds_since_midnight => Time.parse("18:30").seconds_since_midnight.to_i)
Hour.find_or_create_by!(:str_time => "19:00", :seconds_since_midnight => Time.parse("19:00").seconds_since_midnight.to_i)
Hour.find_or_create_by!(:str_time => "19:30", :seconds_since_midnight => Time.parse("19:30").seconds_since_midnight.to_i)
Hour.find_or_create_by!(:str_time => "20:00", :seconds_since_midnight => Time.parse("20:00").seconds_since_midnight.to_i)
Hour.find_or_create_by!(:str_time => "20:30", :seconds_since_midnight => Time.parse("20:30").seconds_since_midnight.to_i)

# User with Institution Owner
user = User.find_or_create_by!(
	:name => "Axel Tagliapietra",
	:email => "axeltaglia@gmail.com"
) do |user|
	user.password = "123456"
 	user.password_confirmation = "123456"
 	user.institution_owner!
end

user.institution_owner = InstitutionOwner.find_or_create_by!(user_id: user.id)

# BeBop Institution
institution = Institution.find_or_create_by!(:name => "BeBop Escuela de Música", :institution_owner_id => user.institution_owner.id)

# BeBop Classrooms
Classroom.find_or_create_by!(:name => "Aula 1", :number => 1, :institution_id => institution.id)
Classroom.find_or_create_by!(:name => "Aula 2", :number => 2, :institution_id => institution.id)
Classroom.find_or_create_by!(:name => "Aula 3", :number => 3, :institution_id => institution.id)

# BeBop Schedules
#Schedule.find_or_create_by!(:day_id => Day.find_by_name("Martes").id, :hour_id => Hour.find_by_str_time("16:00").id, :institution_id => institution.id)
#Schedule.find_or_create_by!(:day_id => Day.find_by_name("Martes").id, :hour_id => Hour.find_by_str_time("17:00").id, :institution_id => institution.id)
#Schedule.find_or_create_by!(:day_id => Day.find_by_name("Martes").id, :hour_id => Hour.find_by_str_time("18:00").id, :institution_id => institution.id)
#Schedule.find_or_create_by!(:day_id => Day.find_by_name("Martes").id, :hour_id => Hour.find_by_str_time("19:00").id, :institution_id => institution.id)

#Schedule.find_or_create_by!(:day_id => Day.find_by_name("Miércoles").id, :hour_id => Hour.find_by_str_time("16:30").id, :institution_id => institution.id)
#Schedule.find_or_create_by!(:day_id => Day.find_by_name("Miércoles").id, :hour_id => Hour.find_by_str_time("17:30").id, :institution_id => institution.id)
#Schedule.find_or_create_by!(:day_id => Day.find_by_name("Miércoles").id, :hour_id => Hour.find_by_str_time("18:30").id, :institution_id => institution.id)
#Schedule.find_or_create_by!(:day_id => Day.find_by_name("Miércoles").id, :hour_id => Hour.find_by_str_time("19:30").id, :institution_id => institution.id)

#Schedule.find_or_create_by!(:day_id => Day.find_by_name("Jueves").id, :hour_id => Hour.find_by_str_time("16:30").id, :institution_id => institution.id)
#Schedule.find_or_create_by!(:day_id => Day.find_by_name("Jueves").id, :hour_id => Hour.find_by_str_time("17:30").id, :institution_id => institution.id)
#Schedule.find_or_create_by!(:day_id => Day.find_by_name("Jueves").id, :hour_id => Hour.find_by_str_time("18:30").id, :institution_id => institution.id)
#Schedule.find_or_create_by!(:day_id => Day.find_by_name("Jueves").id, :hour_id => Hour.find_by_str_time("19:30").id, :institution_id => institution.id)

# BeBop Asignatures

Asignature.find_or_create_by!(:name => "Piano", :institution_id => institution.id)
Asignature.find_or_create_by!(:name => "Canto", :institution_id => institution.id)
Asignature.find_or_create_by!(:name => "Guitarra", :institution_id => institution.id)
Asignature.find_or_create_by!(:name => "Bajo", :institution_id => institution.id)
Asignature.find_or_create_by!(:name => "Batería", :institution_id => institution.id)
Asignature.find_or_create_by!(:name => "Iniciación Musical", :institution_id => institution.id)
Asignature.find_or_create_by!(:name => "Canto y Ukelele", :institution_id => institution.id)







