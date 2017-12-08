# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20171208080551) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "caste_categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "centers", force: :cascade do |t|
    t.string "center_name"
    t.string "address"
    t.string "city"
    t.string "state"
    t.string "pan_card_no"
    t.string "contact"
    t.string "alternate_contact"
    t.date "center_starting_date"
    t.string "contact_person_name"
    t.string "residential_address"
    t.string "center_code"
    t.string "country"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "center_status"
    t.string "countries"
  end

  create_table "course_types", force: :cascade do |t|
    t.string "course_type_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "courses", force: :cascade do |t|
    t.bigint "course_type_id"
    t.bigint "university_id"
    t.string "no_of_seats"
    t.string "fees"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "course_name"
    t.index ["course_type_id"], name: "index_courses_on_course_type_id"
    t.index ["university_id"], name: "index_courses_on_university_id"
  end

  create_table "employees", force: :cascade do |t|
    t.string "name"
    t.string "designation"
    t.string "adhar_card_no"
    t.string "contact_no"
    t.string "alternate_contact_no"
    t.string "email"
    t.date "joining_date"
    t.string "birth_place"
    t.string "address"
    t.string "employee_no"
    t.string "status"
    t.bigint "center_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "employee_status"
    t.index ["center_id"], name: "index_employees_on_center_id"
  end

  create_table "enquiries", force: :cascade do |t|
    t.string "full_name"
    t.string "email"
    t.string "contact_no"
    t.string "alternate_contact_no"
    t.bigint "center_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "remark"
    t.bigint "refarence_id"
    t.bigint "employee_id"
    t.index ["center_id"], name: "index_enquiries_on_center_id"
    t.index ["employee_id"], name: "index_enquiries_on_employee_id"
    t.index ["refarence_id"], name: "index_enquiries_on_refarence_id"
  end

  create_table "general_settings", force: :cascade do |t|
    t.string "registered_name"
    t.string "phone_no"
    t.string "mobile_no"
    t.string "address"
    t.string "email"
    t.string "city"
    t.string "state"
    t.string "pincode"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "logo_file_name"
    t.string "logo_content_type"
    t.integer "logo_file_size"
    t.datetime "logo_updated_at"
  end

  create_table "refarences", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "students", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "middle_name"
    t.string "contact_no"
    t.string "alternate_contact_no"
    t.string "gender"
    t.date "date_of_birth"
    t.string "father_name"
    t.string "mother_name"
    t.string "father_contact_no"
    t.string "mother_contact_no"
    t.string "permanent_address"
    t.string "state"
    t.string "country"
    t.string "tenth"
    t.string "twelth"
    t.string "pcm"
    t.string "pcmb"
    t.string "graduation"
    t.string "post_graduation"
    t.string "passport_available"
    t.string "passport_applied"
    t.string "passport_not_applied"
    t.bigint "course_id"
    t.bigint "center_id"
    t.bigint "university_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "course_type_id"
    t.string "enrollment_number"
    t.string "attachment"
    t.string "twelth_attachment"
    t.string "pg_attachment"
    t.string "ug_attachment"
    t.string "photo_file_name"
    t.string "photo_content_type"
    t.integer "photo_file_size"
    t.datetime "photo_updated_at"
    t.string "email"
    t.string "student_status"
    t.bigint "caste_category_id"
    t.string "fees_paid"
    t.string "original_document_submission"
    t.string "processing_fees_paid"
    t.string "all_document_sent_to_ho"
    t.string "sent_for_visa"
    t.string "sent_for_mci"
    t.string "visa_appointment"
    t.string "mci_acknowledgement"
    t.string "visa_stamping"
    t.string "mci_eligibility_certificate"
    t.string "airticket"
    t.string "fly"
    t.string "mci_eligibility_criteria_certificate_attachment"
    t.string "admission_letter_attachment"
    t.string "enrollment"
    t.string "blood_group"
    t.string "correspondiing_address"
    t.string "alternate_contact"
    t.string "pin_code"
    t.bigint "refarence_id"
    t.bigint "employee_id"
    t.index ["caste_category_id"], name: "index_students_on_caste_category_id"
    t.index ["center_id"], name: "index_students_on_center_id"
    t.index ["course_id"], name: "index_students_on_course_id"
    t.index ["course_type_id"], name: "index_students_on_course_type_id"
    t.index ["employee_id"], name: "index_students_on_employee_id"
    t.index ["refarence_id"], name: "index_students_on_refarence_id"
    t.index ["university_id"], name: "index_students_on_university_id"
  end

  create_table "universities", force: :cascade do |t|
    t.string "university_name"
    t.string "description"
    t.string "country"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "unversity_attachments", force: :cascade do |t|
    t.bigint "university_id"
    t.string "attachment"
    t.string "attachment_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["university_id"], name: "index_unversity_attachments_on_university_id"
  end

  create_table "user_employees", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "employee_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["employee_id"], name: "index_user_employees_on_employee_id"
    t.index ["user_id"], name: "index_user_employees_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.bigint "general_setting_id"
    t.integer "employee_id"
    t.integer "student_id"
    t.string "role"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "photo_file_name"
    t.string "photo_content_type"
    t.integer "photo_file_size"
    t.datetime "photo_updated_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["general_setting_id"], name: "index_users_on_general_setting_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "courses", "course_types"
  add_foreign_key "courses", "universities"
  add_foreign_key "employees", "centers"
  add_foreign_key "enquiries", "centers"
  add_foreign_key "enquiries", "employees"
  add_foreign_key "enquiries", "refarences"
  add_foreign_key "students", "caste_categories"
  add_foreign_key "students", "centers"
  add_foreign_key "students", "course_types"
  add_foreign_key "students", "courses"
  add_foreign_key "students", "employees"
  add_foreign_key "students", "refarences"
  add_foreign_key "students", "universities"
  add_foreign_key "user_employees", "employees"
  add_foreign_key "user_employees", "users"
end
