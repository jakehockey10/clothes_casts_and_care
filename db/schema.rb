# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20150810020605) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.string   "email",              default: "", null: false
    t.string   "encrypted_password", default: "", null: false
    t.integer  "sign_in_count",      default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.integer  "failed_attempts",    default: 0,  null: false
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  add_index "admins", ["email"], name: "index_admins_on_email", unique: true, using: :btree
  add_index "admins", ["unlock_token"], name: "index_admins_on_unlock_token", unique: true, using: :btree

  create_table "feedbacks", force: :cascade do |t|
    t.integer  "meet_needs_answer"
    t.text     "suggestions"
    t.text     "challenges"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "pointless_feedback_messages", force: :cascade do |t|
    t.string   "name"
    t.string   "email_address"
    t.string   "topic"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rapidfire_answer_groups", force: :cascade do |t|
    t.integer  "question_group_id"
    t.integer  "user_id"
    t.string   "user_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "rapidfire_answer_groups", ["question_group_id"], name: "index_rapidfire_answer_groups_on_question_group_id", using: :btree
  add_index "rapidfire_answer_groups", ["user_id", "user_type"], name: "index_rapidfire_answer_groups_on_user_id_and_user_type", using: :btree

  create_table "rapidfire_question_groups", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rapidfire_questions", force: :cascade do |t|
    t.integer  "question_group_id"
    t.string   "type"
    t.string   "question_text"
    t.integer  "position"
    t.text     "answer_options"
    t.text     "validation_rules"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "rapidfire_questions", ["question_group_id"], name: "index_rapidfire_questions_on_question_group_id", using: :btree

end
