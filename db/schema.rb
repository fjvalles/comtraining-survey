# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_11_14_195606) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "action_text_rich_texts", force: :cascade do |t|
    t.string "name", null: false
    t.text "body"
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["record_type", "record_id", "name"], name: "index_action_text_rich_texts_uniqueness", unique: true
  end

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "answers", id: :serial, force: :cascade do |t|
    t.integer "response_id"
    t.integer "question_id"
    t.text "a_text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["question_id"], name: "index_answers_on_question_id"
    t.index ["response_id"], name: "index_answers_on_response_id"
  end

  create_table "answers_options", id: :serial, force: :cascade do |t|
    t.integer "option_id"
    t.integer "answer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["answer_id"], name: "index_answers_options_on_answer_id"
    t.index ["option_id"], name: "index_answers_options_on_option_id"
  end

  create_table "companies", id: :serial, force: :cascade do |t|
    t.string "name"
    t.string "ceo"
    t.string "industry"
    t.string "address"
    t.string "identity_number"
    t.string "region"
    t.string "province"
    t.string "commune"
    t.string "country"
    t.string "url"
    t.string "contact_email"
    t.string "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "employees", id: :serial, force: :cascade do |t|
    t.boolean "self_evaluation"
    t.date "birthdate"
    t.integer "e_type", default: 0
    t.integer "survey_id"
    t.integer "response_id"
    t.integer "evaluator_id"
    t.string "first_name"
    t.string "last_name"
    t.string "personal_email"
    t.string "work_email"
    t.string "mobile_phone"
    t.string "home_phone"
    t.string "work_phone"
    t.string "address"
    t.string "identity_number"
    t.string "region"
    t.string "province"
    t.string "commune"
    t.string "country"
    t.string "job_title"
    t.string "seniority"
    t.string "work_area"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["evaluator_id"], name: "index_employees_on_evaluator_id"
    t.index ["response_id"], name: "index_employees_on_response_id"
    t.index ["survey_id"], name: "index_employees_on_survey_id"
  end

  create_table "options", id: :serial, force: :cascade do |t|
    t.integer "order", default: 1
    t.integer "question_id"
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["question_id"], name: "index_options_on_question_id"
  end

  create_table "options_question_defaults", id: false, force: :cascade do |t|
    t.integer "option_id"
    t.integer "question_default_id"
    t.index ["option_id"], name: "index_options_question_defaults_on_option_id"
    t.index ["question_default_id"], name: "index_options_question_defaults_on_question_default_id"
  end

  create_table "proficiencies", id: :serial, force: :cascade do |t|
    t.integer "survey_id"
    t.string "name"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["survey_id"], name: "index_proficiencies_on_survey_id"
  end

  create_table "question_defaults", id: :serial, force: :cascade do |t|
    t.integer "q_type"
    t.integer "survey_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["q_type", "survey_id"], name: "index_question_defaults_on_q_type_and_survey_id", unique: true
    t.index ["survey_id"], name: "index_question_defaults_on_survey_id"
  end

  create_table "questions", id: :serial, force: :cascade do |t|
    t.boolean "required", default: true
    t.integer "q_type", default: 0
    t.integer "scale", default: 0
    t.integer "order", default: 1
    t.integer "survey_id"
    t.integer "proficiency_id"
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["proficiency_id"], name: "index_questions_on_proficiency_id"
    t.index ["survey_id"], name: "index_questions_on_survey_id"
  end

  create_table "responses", id: :serial, force: :cascade do |t|
    t.integer "survey_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["survey_id"], name: "index_responses_on_survey_id"
    t.index ["user_id"], name: "index_responses_on_user_id"
  end

  create_table "surveys", id: :serial, force: :cascade do |t|
    t.boolean "default_alignment", default: true
    t.boolean "active", default: false
    t.datetime "start_date"
    t.datetime "end_date"
    t.integer "s_type", default: 0
    t.integer "questionnaire_scale", default: 0
    t.integer "responses_count", default: 0
    t.integer "participants_count", default: 0
    t.integer "company_id"
    t.string "title"
    t.string "token"
    t.string "demographic_title"
    t.string "questionaire_title"
    t.string "open_questions_title"
    t.text "welcome_msg"
    t.text "instructions"
    t.text "goodbye_msg"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_surveys_on_company_id"
    t.index ["token"], name: "index_surveys_on_token"
  end

  create_table "users", id: :serial, force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.integer "role"
    t.boolean "active", default: true
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
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
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "answers", "questions"
  add_foreign_key "answers", "responses"
  add_foreign_key "answers_options", "answers"
  add_foreign_key "answers_options", "options"
  add_foreign_key "employees", "responses"
  add_foreign_key "employees", "surveys"
  add_foreign_key "options", "questions"
  add_foreign_key "proficiencies", "surveys"
  add_foreign_key "question_defaults", "surveys"
  add_foreign_key "questions", "proficiencies"
  add_foreign_key "questions", "surveys"
  add_foreign_key "responses", "surveys"
  add_foreign_key "responses", "users"
  add_foreign_key "surveys", "companies"
end
