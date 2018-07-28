class StudentsService
  def destroy_user(student)
  	  user = student.user
      student.destroy
      user.destroy
  end
end