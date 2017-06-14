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

ActiveRecord::Schema.define(version: 20170614145112) do

  create_table "answers", force: :cascade do |t|
    t.string   "ans"
    t.boolean  "is_correct"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "quiz_id"
    t.integer  "teacher_id"
    t.index ["quiz_id"], name: "index_answers_on_quiz_id"
    t.index ["user_id", "created_at"], name: "index_answers_on_user_id_and_created_at"
    t.index ["user_id"], name: "index_answers_on_user_id"
  end

  create_table "quizzes", force: :cascade do |t|
    t.text     "question"
    t.string   "answer"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id", "created_at"], name: "index_quizzes_on_user_id_and_created_at"
    t.index ["user_id"], name: "index_quizzes_on_user_id"
  end

  create_table "relationships", force: :cascade do |t|
    t.integer  "enroller_id"
    t.integer  "enrolled_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["enrolled_id"], name: "index_relationships_on_enrolled_id"
    t.index ["enroller_id", "enrolled_id"], name: "index_relationships_on_enroller_id_and_enrolled_id", unique: true
    t.index ["enroller_id"], name: "index_relationships_on_enroller_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.text     "first_name"
    t.text     "last_name"
    t.string   "user_type"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
