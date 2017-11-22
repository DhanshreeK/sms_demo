require 'test_helper'

class StudentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @student = students(:one)
  end

  test "should get index" do
    get students_url
    assert_response :success
  end

  test "should get new" do
    get new_student_url
    assert_response :success
  end

  test "should create student" do
    assert_difference('Student.count') do
      post students_url, params: { student: { alternate_contact_no: @student.alternate_contact_no, center_id: @student.center_id, contact_no: @student.contact_no, country: @student.country, course_id: @student.course_id, date_of_birth: @student.date_of_birth, father_contact_no: @student.father_contact_no, father_name: @student.father_name, first_name: @student.first_name, gender: @student.gender, graduation: @student.graduation, last_name: @student.last_name, middle_name: @student.middle_name, mother_contact_no: @student.mother_contact_no, mother_name: @student.mother_name, passport_applied: @student.passport_applied, passport_available: @student.passport_available, passport_not_applied: @student.passport_not_applied, pcm: @student.pcm, pcmb: @student.pcmb, permanent_address: @student.permanent_address, post_graduation: @student.post_graduation, state: @student.state, tenth: @student.tenth, twelth: @student.twelth, university_id: @student.university_id } }
    end

    assert_redirected_to student_url(Student.last)
  end

  test "should show student" do
    get student_url(@student)
    assert_response :success
  end

  test "should get edit" do
    get edit_student_url(@student)
    assert_response :success
  end

  test "should update student" do
    patch student_url(@student), params: { student: { alternate_contact_no: @student.alternate_contact_no, center_id: @student.center_id, contact_no: @student.contact_no, country: @student.country, course_id: @student.course_id, date_of_birth: @student.date_of_birth, father_contact_no: @student.father_contact_no, father_name: @student.father_name, first_name: @student.first_name, gender: @student.gender, graduation: @student.graduation, last_name: @student.last_name, middle_name: @student.middle_name, mother_contact_no: @student.mother_contact_no, mother_name: @student.mother_name, passport_applied: @student.passport_applied, passport_available: @student.passport_available, passport_not_applied: @student.passport_not_applied, pcm: @student.pcm, pcmb: @student.pcmb, permanent_address: @student.permanent_address, post_graduation: @student.post_graduation, state: @student.state, tenth: @student.tenth, twelth: @student.twelth, university_id: @student.university_id } }
    assert_redirected_to student_url(@student)
  end

  test "should destroy student" do
    assert_difference('Student.count', -1) do
      delete student_url(@student)
    end

    assert_redirected_to students_url
  end
end
