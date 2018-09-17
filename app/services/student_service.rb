class StudentService
  def destroy_student(student)
  	  user = student.user
      student.destroy
      user.destroy
  end
end