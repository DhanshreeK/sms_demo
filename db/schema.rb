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

ActiveRecord::Schema.define(version: 20180620082016) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "activities", force: :cascade do |t|
    t.string "trackable_type"
    t.bigint "trackable_id"
    t.string "owner_type"
    t.bigint "owner_id"
    t.string "key"
    t.text "parameters"
    t.string "recipient_type"
    t.bigint "recipient_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["owner_id", "owner_type"], name: "index_activities_on_owner_id_and_owner_type"
    t.index ["owner_type", "owner_id"], name: "index_activities_on_owner_type_and_owner_id"
    t.index ["recipient_id", "recipient_type"], name: "index_activities_on_recipient_id_and_recipient_type"
    t.index ["recipient_type", "recipient_id"], name: "index_activities_on_recipient_type_and_recipient_id"
    t.index ["trackable_id", "trackable_type"], name: "index_activities_on_trackable_id_and_trackable_type"
    t.index ["trackable_type", "trackable_id"], name: "index_activities_on_trackable_type_and_trackable_id"
  end

  create_table "answers", force: :cascade do |t|
    t.string "answer"
    t.bigint "question_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["question_id"], name: "index_answers_on_question_id"
  end

  create_table "budgets", force: :cascade do |t|
    t.string "budget"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "budget_from"
    t.string "budget_to"
  end

  create_table "bulk_sms_settings", force: :cascade do |t|
    t.string "send_sms"
    t.string "body"
    t.integer "center_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "student_id"
  end

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
    t.string "email"
    t.integer "sms_setting_id"
    t.bigint "email_setting_id"
    t.string "photo_file_name"
    t.string "photo_content_type"
    t.integer "photo_file_size"
    t.datetime "photo_updated_at"
    t.string "photo"
    t.index ["email_setting_id"], name: "index_centers_on_email_setting_id"
  end

  create_table "colleges", force: :cascade do |t|
    t.string "name"
    t.string "city"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "country"
    t.string "fees"
    t.bigint "budget_id"
    t.index ["budget_id"], name: "index_colleges_on_budget_id"
  end

  create_table "comments", force: :cascade do |t|
    t.text "body"
    t.bigint "student_detail_id"
    t.datetime "stoptime"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["student_detail_id"], name: "index_comments_on_student_detail_id"
  end

  create_table "countries", force: :cascade do |t|
    t.string "country"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "course_types", force: :cascade do |t|
    t.string "course_type_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "center_id"
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
    t.integer "center_id"
    t.index ["course_type_id"], name: "index_courses_on_course_type_id"
    t.index ["university_id"], name: "index_courses_on_university_id"
  end

  create_table "email_settings", force: :cascade do |t|
    t.string "body"
    t.bigint "center_id"
    t.bigint "student_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "send_email"
    t.index ["center_id"], name: "index_email_settings_on_center_id"
    t.index ["student_id"], name: "index_email_settings_on_student_id"
  end

  create_table "emails", force: :cascade do |t|
    t.string "to"
    t.string "sub"
    t.text "body"
    t.bigint "student_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "attachment"
    t.string "cc"
    t.string "bcc"
    t.string "attachment2"
    t.index ["student_id"], name: "index_emails_on_student_id"
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
    t.integer "sms_setting_id"
    t.bigint "email_setting_id"
    t.string "photo_file_name"
    t.string "photo_content_type"
    t.integer "photo_file_size"
    t.datetime "photo_updated_at"
    t.index ["center_id"], name: "index_employees_on_center_id"
    t.index ["email_setting_id"], name: "index_employees_on_email_setting_id"
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

  create_table "envelopes", force: :cascade do |t|
    t.bigint "student_id"
    t.bigint "center_id"
    t.string "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "date"
    t.index ["center_id"], name: "index_envelopes_on_center_id"
    t.index ["student_id"], name: "index_envelopes_on_student_id"
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

  create_table "important_documents", force: :cascade do |t|
    t.string "title"
    t.string "file_upload"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "medical_colleges", force: :cascade do |t|
    t.string "college_name"
    t.bigint "country_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["country_id"], name: "index_medical_colleges_on_country_id"
  end

  create_table "pending_payments", force: :cascade do |t|
    t.bigint "student_id"
    t.bigint "receipt_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "fees_pending"
    t.string "discount"
    t.string "fees_paid"
    t.boolean "payment_status"
    t.bigint "center_id"
    t.index ["center_id"], name: "index_pending_payments_on_center_id"
    t.index ["receipt_id"], name: "index_pending_payments_on_receipt_id"
    t.index ["student_id"], name: "index_pending_payments_on_student_id"
  end

  create_table "questions", force: :cascade do |t|
    t.string "question"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "student_detail_id"
    t.index ["student_detail_id"], name: "index_questions_on_student_detail_id"
  end

  create_table "receipts", force: :cascade do |t|
    t.string "gst_no"
    t.string "date"
    t.string "received_from"
    t.string "amount"
    t.string "towards"
    t.string "payment_mode"
    t.string "check_no"
    t.string "check_date"
    t.string "bank_name"
    t.string "transaction_id"
    t.bigint "student_id"
    t.bigint "center_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "pending_payment"
    t.string "payment_paid"
    t.string "payment"
    t.date "payment_date"
    t.string "discount"
    t.string "place_of_supply"
    t.string "invoice_number"
    t.string "gstin_no_of_customer"
    t.string "description_of_services"
    t.string "taxable_value"
    t.string "cgst"
    t.string "sgst"
    t.string "igst"
    t.string "total_rate"
    t.string "total_amt"
    t.string "current_payment"
    t.index ["center_id"], name: "index_receipts_on_center_id"
    t.index ["student_id"], name: "index_receipts_on_student_id"
  end

  create_table "refarences", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reports", force: :cascade do |t|
    t.date "start_date"
    t.date "end_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "selected_courses", force: :cascade do |t|
    t.bigint "student_detail_id"
    t.bigint "course_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "medical_college_id"
    t.bigint "country_id"
    t.index ["country_id"], name: "index_selected_courses_on_country_id"
    t.index ["course_id"], name: "index_selected_courses_on_course_id"
    t.index ["medical_college_id"], name: "index_selected_courses_on_medical_college_id"
    t.index ["student_detail_id"], name: "index_selected_courses_on_student_detail_id"
  end

  create_table "sms_settings", force: :cascade do |t|
    t.string "send_sms"
    t.string "body"
    t.string "contact"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "status_updates", force: :cascade do |t|
    t.string "add_status"
    t.string "remarks"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "student_answers", force: :cascade do |t|
    t.bigint "student_detail_id"
    t.bigint "question_id"
    t.bigint "answer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["answer_id"], name: "index_student_answers_on_answer_id"
    t.index ["question_id"], name: "index_student_answers_on_question_id"
    t.index ["student_detail_id"], name: "index_student_answers_on_student_detail_id"
  end

  create_table "student_details", force: :cascade do |t|
    t.string "first_name"
    t.string "middle_name"
    t.string "last_name"
    t.string "email"
    t.text "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "contact_no"
    t.string "time"
    t.string "course_applied_for"
    t.string "age"
    t.date "birthdate"
    t.string "father_name"
    t.string "mother_name"
    t.string "father_education"
    t.string "father_occupation"
    t.string "mother_education"
    t.string "ssc_marks"
    t.string "hsc_marks"
    t.string "pcb"
    t.string "pcm"
    t.text "signature"
    t.time "stoptime"
    t.string "mother_occupation"
    t.string "category_list"
    t.string "alternate_no"
    t.string "wp_no"
    t.string "neet"
    t.bigint "college_id"
    t.bigint "budget_id"
    t.bigint "country_id"
    t.bigint "medical_college_id"
    t.bigint "status_update_id"
    t.index ["budget_id"], name: "index_student_details_on_budget_id"
    t.index ["college_id"], name: "index_student_details_on_college_id"
    t.index ["country_id"], name: "index_student_details_on_country_id"
    t.index ["medical_college_id"], name: "index_student_details_on_medical_college_id"
    t.index ["status_update_id"], name: "index_student_details_on_status_update_id"
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
    t.string "reference_student"
    t.string "permanent_pin"
    t.date "admission_year"
    t.index ["caste_category_id"], name: "index_students_on_caste_category_id"
    t.index ["center_id"], name: "index_students_on_center_id"
    t.index ["course_id"], name: "index_students_on_course_id"
    t.index ["course_type_id"], name: "index_students_on_course_type_id"
    t.index ["employee_id"], name: "index_students_on_employee_id"
    t.index ["refarence_id"], name: "index_students_on_refarence_id"
    t.index ["university_id"], name: "index_students_on_university_id"
  end

  create_table "subadmins", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "subadmin_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "universities", force: :cascade do |t|
    t.string "university_name"
    t.string "description"
    t.string "country"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "center_id"
    t.string "fees"
    t.string "no_of_seats"
  end

  create_table "unversity_attachments", force: :cascade do |t|
    t.bigint "university_id"
    t.string "attachment"
    t.string "attachment_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["university_id"], name: "index_unversity_attachments_on_university_id"
  end

  create_table "user_activities", force: :cascade do |t|
    t.string "modelname"
    t.integer "model_id"
    t.string "action"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_user_activities_on_user_id"
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
    t.integer "center_id"
    t.integer "sms_setting_id"
    t.bigint "email_setting_id"
    t.bigint "subadmin_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["email_setting_id"], name: "index_users_on_email_setting_id"
    t.index ["general_setting_id"], name: "index_users_on_general_setting_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["subadmin_id"], name: "index_users_on_subadmin_id"
  end

  add_foreign_key "centers", "email_settings"
  add_foreign_key "colleges", "budgets"
  add_foreign_key "comments", "student_details"
  add_foreign_key "courses", "course_types"
  add_foreign_key "courses", "universities"
  add_foreign_key "email_settings", "centers"
  add_foreign_key "email_settings", "students"
  add_foreign_key "emails", "students"
  add_foreign_key "employees", "centers"
  add_foreign_key "employees", "email_settings"
  add_foreign_key "enquiries", "centers"
  add_foreign_key "enquiries", "employees"
  add_foreign_key "enquiries", "refarences"
  add_foreign_key "envelopes", "centers"
  add_foreign_key "envelopes", "students"
  add_foreign_key "medical_colleges", "countries"
  add_foreign_key "pending_payments", "centers"
  add_foreign_key "pending_payments", "receipts"
  add_foreign_key "pending_payments", "students"
  add_foreign_key "receipts", "centers"
  add_foreign_key "receipts", "students"
  add_foreign_key "selected_courses", "countries"
  add_foreign_key "selected_courses", "courses"
  add_foreign_key "selected_courses", "medical_colleges"
  add_foreign_key "selected_courses", "student_details"
  add_foreign_key "student_details", "budgets"
  add_foreign_key "student_details", "colleges"
  add_foreign_key "student_details", "countries"
  add_foreign_key "student_details", "medical_colleges"
  add_foreign_key "student_details", "status_updates"
  add_foreign_key "students", "caste_categories"
  add_foreign_key "students", "centers"
  add_foreign_key "students", "course_types"
  add_foreign_key "students", "courses"
  add_foreign_key "students", "employees"
  add_foreign_key "students", "refarences"
  add_foreign_key "students", "universities"
  add_foreign_key "user_activities", "users"
  add_foreign_key "user_employees", "employees"
  add_foreign_key "user_employees", "users"
  add_foreign_key "users", "email_settings"
  add_foreign_key "users", "subadmins"
end
