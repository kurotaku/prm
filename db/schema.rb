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

ActiveRecord::Schema.define(version: 2021_05_30_084814) do

  create_table "agents", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "maker_group_id", null: false
    t.bigint "vendor_group_id", null: false
    t.bigint "company_id", null: false
    t.integer "hierarchy"
    t.bigint "parent_id"
    t.text "vendor_memo"
    t.integer "status", default: 10, null: false
    t.string "uid"
    t.datetime "deleted_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["company_id"], name: "index_agents_on_company_id"
    t.index ["maker_group_id"], name: "index_agents_on_maker_group_id"
    t.index ["parent_id"], name: "index_agents_on_parent_id"
    t.index ["vendor_group_id"], name: "index_agents_on_vendor_group_id"
  end

  create_table "boards", charset: "utf8mb4", force: :cascade do |t|
    t.string "related_object"
    t.string "related_object_uid"
    t.integer "status", default: 10, null: false
    t.string "uid"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "companies", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "prefecture_id"
    t.string "name"
    t.string "name_kana"
    t.string "coprate_number"
    t.string "postcode"
    t.string "address"
    t.string "address2"
    t.string "phone"
    t.string "fax"
    t.integer "settlement_month"
    t.string "image"
    t.string "email"
    t.integer "status", default: 10, null: false
    t.integer "contract_type", default: 10, null: false
    t.string "uid"
    t.datetime "deleted_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["prefecture_id"], name: "index_companies_on_prefecture_id"
  end

  create_table "csv_import_histories", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "maker_group_id", null: false
    t.integer "related_object", default: 10, null: false
    t.string "file_name"
    t.text "cache"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["maker_group_id"], name: "index_csv_import_histories_on_maker_group_id"
  end

  create_table "download_file_histories", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "shared_file_id", null: false
    t.string "uid"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["shared_file_id"], name: "index_download_file_histories_on_shared_file_id"
    t.index ["user_id"], name: "index_download_file_histories_on_user_id"
  end

  create_table "lead_column_select_items", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "lead_column_id", null: false
    t.string "name"
    t.integer "order"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["lead_column_id"], name: "index_lead_column_select_items_on_lead_column_id"
  end

  create_table "lead_columns", charset: "utf8mb4", force: :cascade do |t|
    t.string "name"
    t.string "key_name"
    t.string "lead_attribute"
    t.bigint "product_id", null: false
    t.integer "contract_type", default: 10, null: false
    t.integer "data_type", default: 10, null: false
    t.integer "order", null: false
    t.integer "index_page_order"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["product_id"], name: "index_lead_columns_on_product_id"
  end

  create_table "leads", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "maker_group_id", null: false
    t.bigint "partner_id"
    t.bigint "product_id"
    t.string "unique_key"
    t.integer "contract_type", default: 10, null: false
    t.integer "progress"
    t.text "index_cache"
    t.text "show_cache"
    t.bigint "user_info_partner_1_id"
    t.bigint "user_info_partner_2_id"
    t.bigint "user_info_partner_3_id"
    t.bigint "select_item_1_id"
    t.bigint "select_item_2_id"
    t.bigint "select_item_3_id"
    t.bigint "select_item_4_id"
    t.bigint "select_item_5_id"
    t.bigint "select_item_6_id"
    t.bigint "select_item_7_id"
    t.bigint "select_item_8_id"
    t.bigint "select_item_9_id"
    t.bigint "select_item_10_id"
    t.datetime "datetime_1"
    t.datetime "datetime_2"
    t.datetime "datetime_3"
    t.datetime "datetime_4"
    t.datetime "datetime_5"
    t.string "string_1"
    t.string "string_2"
    t.string "string_3"
    t.string "string_4"
    t.string "string_5"
    t.float "float_1"
    t.float "float_2"
    t.float "float_3"
    t.float "float_4"
    t.float "float_5"
    t.text "text_1"
    t.text "text_2"
    t.text "text_3"
    t.text "text_4"
    t.text "text_5"
    t.integer "integer_1"
    t.integer "integer_2"
    t.integer "integer_3"
    t.integer "integer_4"
    t.integer "integer_5"
    t.float "price_1"
    t.float "price_2"
    t.float "price_3"
    t.float "price_4"
    t.float "price_5"
    t.bigint "prefecture_1_id"
    t.bigint "prefecture_2_id"
    t.bigint "prefecture_3_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["maker_group_id"], name: "index_leads_on_maker_group_id"
    t.index ["partner_id"], name: "index_leads_on_partner_id"
    t.index ["prefecture_1_id"], name: "index_leads_on_prefecture_1_id"
    t.index ["prefecture_2_id"], name: "index_leads_on_prefecture_2_id"
    t.index ["prefecture_3_id"], name: "index_leads_on_prefecture_3_id"
    t.index ["product_id"], name: "index_leads_on_product_id"
    t.index ["progress"], name: "index_leads_on_progress"
    t.index ["select_item_10_id"], name: "index_leads_on_select_item_10_id"
    t.index ["select_item_1_id"], name: "index_leads_on_select_item_1_id"
    t.index ["select_item_2_id"], name: "index_leads_on_select_item_2_id"
    t.index ["select_item_3_id"], name: "index_leads_on_select_item_3_id"
    t.index ["select_item_4_id"], name: "index_leads_on_select_item_4_id"
    t.index ["select_item_5_id"], name: "index_leads_on_select_item_5_id"
    t.index ["select_item_6_id"], name: "index_leads_on_select_item_6_id"
    t.index ["select_item_7_id"], name: "index_leads_on_select_item_7_id"
    t.index ["select_item_8_id"], name: "index_leads_on_select_item_8_id"
    t.index ["select_item_9_id"], name: "index_leads_on_select_item_9_id"
    t.index ["unique_key", "product_id"], name: "index_leads_on_unique_key_and_product_id", unique: true
    t.index ["user_info_partner_1_id"], name: "index_leads_on_user_info_partner_1_id"
    t.index ["user_info_partner_2_id"], name: "index_leads_on_user_info_partner_2_id"
    t.index ["user_info_partner_3_id"], name: "index_leads_on_user_info_partner_3_id"
  end

  create_table "maker_group_user_infos", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "maker_group_id", null: false
    t.bigint "user_id"
    t.bigint "company_id"
    t.bigint "partner_id"
    t.string "uid"
    t.string "unique_key"
    t.string "name"
    t.string "phone"
    t.string "email"
    t.integer "status", default: 10, null: false
    t.datetime "deleted_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["company_id"], name: "index_maker_group_user_infos_on_company_id"
    t.index ["maker_group_id"], name: "index_maker_group_user_infos_on_maker_group_id"
    t.index ["partner_id"], name: "index_maker_group_user_infos_on_partner_id"
    t.index ["user_id"], name: "index_maker_group_user_infos_on_user_id"
  end

  create_table "maker_groups", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "maker_id", null: false
    t.integer "status", default: 10, null: false
    t.string "uid"
    t.datetime "deleted_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["maker_id"], name: "index_maker_groups_on_maker_id"
  end

  create_table "messages", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "board_id", null: false
    t.bigint "user_id", null: false
    t.text "content"
    t.integer "status", default: 10, null: false
    t.string "uid"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["board_id"], name: "index_messages_on_board_id"
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "partners", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "maker_group_id", null: false
    t.bigint "company_id"
    t.string "name"
    t.string "address"
    t.integer "hierarchy", default: 1
    t.bigint "parent_id"
    t.text "maker_memo"
    t.integer "status", default: 10, null: false
    t.string "uid"
    t.datetime "deleted_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["company_id"], name: "index_partners_on_company_id"
    t.index ["maker_group_id"], name: "index_partners_on_maker_group_id"
    t.index ["parent_id"], name: "index_partners_on_parent_id"
  end

  create_table "prefectures", charset: "utf8mb4", force: :cascade do |t|
    t.string "code"
    t.string "name"
    t.integer "status", default: 10, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "products", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "maker_group_id", null: false
    t.string "code"
    t.string "name"
    t.string "image"
    t.integer "agency_price"
    t.integer "agency_incentive"
    t.text "agency_description"
    t.integer "introduction_price"
    t.integer "introduction_incentive"
    t.text "introduction_description"
    t.integer "wholesale_price"
    t.integer "wholesale_incentive"
    t.text "wholesale_description"
    t.integer "status", default: 10, null: false
    t.string "uid"
    t.datetime "deleted_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["maker_group_id"], name: "index_products_on_maker_group_id"
  end

  create_table "shared_files", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "maker_group_id", null: false
    t.bigint "user_id", null: false
    t.string "uid"
    t.string "file"
    t.string "file_name"
    t.string "name"
    t.string "human_size"
    t.integer "file_size"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["maker_group_id"], name: "index_shared_files_on_maker_group_id"
    t.index ["user_id"], name: "index_shared_files_on_user_id"
  end

  create_table "user_action_permissions", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "company_id", null: false
    t.bigint "user_action_id", null: false
    t.integer "permit_role"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["company_id"], name: "index_user_action_permissions_on_company_id"
    t.index ["user_action_id"], name: "index_user_action_permissions_on_user_action_id"
  end

  create_table "user_actions", charset: "utf8mb4", force: :cascade do |t|
    t.string "ctrl_path"
    t.string "act_path"
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "user_profiles", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "company_id", null: false
    t.integer "status", default: 10, null: false
    t.string "uid"
    t.string "code"
    t.string "name"
    t.string "phone"
    t.string "email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["company_id"], name: "index_user_profiles_on_company_id"
    t.index ["user_id"], name: "index_user_profiles_on_user_id"
  end

  create_table "users", charset: "utf8mb4", force: :cascade do |t|
    t.string "name"
    t.bigint "company_id", null: false
    t.integer "role", default: 10, null: false
    t.integer "account_type", default: 10, null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.string "image"
    t.integer "status", default: 10, null: false
    t.string "uid"
    t.datetime "deleted_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["company_id"], name: "index_users_on_company_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "vendor_groups", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "maker_group_id", null: false
    t.bigint "vendor_id", null: false
    t.bigint "product_id", null: false
    t.string "product_name"
    t.integer "price"
    t.integer "incentive"
    t.integer "contract_type", default: 10, null: false
    t.integer "layer"
    t.integer "status", default: 10, null: false
    t.text "description"
    t.text "maker_memo"
    t.date "contracted_at"
    t.integer "settlement_month"
    t.string "uid"
    t.datetime "deleted_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["maker_group_id"], name: "index_vendor_groups_on_maker_group_id"
    t.index ["product_id"], name: "index_vendor_groups_on_product_id"
    t.index ["vendor_id"], name: "index_vendor_groups_on_vendor_id"
  end

  add_foreign_key "agents", "companies"
  add_foreign_key "agents", "companies", column: "parent_id"
  add_foreign_key "agents", "maker_groups"
  add_foreign_key "agents", "vendor_groups"
  add_foreign_key "companies", "prefectures"
  add_foreign_key "csv_import_histories", "maker_groups"
  add_foreign_key "download_file_histories", "shared_files"
  add_foreign_key "download_file_histories", "users"
  add_foreign_key "lead_column_select_items", "lead_columns"
  add_foreign_key "lead_columns", "products"
  add_foreign_key "leads", "lead_column_select_items", column: "select_item_10_id"
  add_foreign_key "leads", "lead_column_select_items", column: "select_item_1_id"
  add_foreign_key "leads", "lead_column_select_items", column: "select_item_2_id"
  add_foreign_key "leads", "lead_column_select_items", column: "select_item_3_id"
  add_foreign_key "leads", "lead_column_select_items", column: "select_item_4_id"
  add_foreign_key "leads", "lead_column_select_items", column: "select_item_5_id"
  add_foreign_key "leads", "lead_column_select_items", column: "select_item_6_id"
  add_foreign_key "leads", "lead_column_select_items", column: "select_item_7_id"
  add_foreign_key "leads", "lead_column_select_items", column: "select_item_8_id"
  add_foreign_key "leads", "lead_column_select_items", column: "select_item_9_id"
  add_foreign_key "leads", "maker_group_user_infos", column: "user_info_partner_1_id"
  add_foreign_key "leads", "maker_group_user_infos", column: "user_info_partner_2_id"
  add_foreign_key "leads", "maker_group_user_infos", column: "user_info_partner_3_id"
  add_foreign_key "leads", "maker_groups"
  add_foreign_key "leads", "partners"
  add_foreign_key "leads", "prefectures", column: "prefecture_1_id"
  add_foreign_key "leads", "prefectures", column: "prefecture_2_id"
  add_foreign_key "leads", "prefectures", column: "prefecture_3_id"
  add_foreign_key "leads", "products"
  add_foreign_key "maker_group_user_infos", "companies"
  add_foreign_key "maker_group_user_infos", "maker_groups"
  add_foreign_key "maker_group_user_infos", "partners"
  add_foreign_key "maker_group_user_infos", "users"
  add_foreign_key "maker_groups", "companies", column: "maker_id"
  add_foreign_key "messages", "boards"
  add_foreign_key "messages", "users"
  add_foreign_key "partners", "maker_groups"
  add_foreign_key "partners", "partners", column: "parent_id"
  add_foreign_key "products", "maker_groups"
  add_foreign_key "shared_files", "maker_groups"
  add_foreign_key "shared_files", "users"
  add_foreign_key "user_action_permissions", "companies"
  add_foreign_key "user_action_permissions", "user_actions"
  add_foreign_key "user_profiles", "companies"
  add_foreign_key "user_profiles", "users"
  add_foreign_key "users", "companies"
  add_foreign_key "vendor_groups", "maker_groups"
  add_foreign_key "vendor_groups", "partners", column: "vendor_id"
  add_foreign_key "vendor_groups", "products"
end
