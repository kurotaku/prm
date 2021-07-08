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

ActiveRecord::Schema.define(version: 2021_07_05_105109) do

  create_table "boards", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "vendor_group_id", null: false
    t.string "related_object"
    t.string "related_object_uid"
    t.string "uid"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["vendor_group_id"], name: "index_boards_on_vendor_group_id"
  end

  create_table "companies", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "vendor_group_id", null: false
    t.bigint "organization_id"
    t.integer "hierarchy", default: 1
    t.bigint "parent_id"
    t.integer "sales_amount", default: 0, null: false
    t.integer "sales_price_amount", default: 0, null: false
    t.integer "partnership_type", default: 10, null: false
    t.string "uid"
    t.datetime "deleted_at"
    t.string "name"
    t.string "unique_key"
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
    t.string "string_6"
    t.string "string_7"
    t.string "string_8"
    t.string "string_9"
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
    t.float "float_1"
    t.float "float_2"
    t.float "float_3"
    t.float "float_4"
    t.float "float_5"
    t.string "calc_1"
    t.string "calc_2"
    t.string "calc_3"
    t.string "calc_4"
    t.string "calc_5"
    t.string "lookup_1"
    t.string "lookup_2"
    t.string "lookup_3"
    t.string "lookup_4"
    t.string "lookup_5"
    t.string "stacked_1"
    t.string "stacked_2"
    t.string "stacked_3"
    t.string "stacked_4"
    t.string "stacked_5"
    t.text "vendor_memo"
    t.text "index_cache"
    t.text "show_cache"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["organization_id"], name: "index_companies_on_organization_id"
    t.index ["parent_id"], name: "index_companies_on_parent_id"
    t.index ["select_item_10_id"], name: "index_companies_on_select_item_10_id"
    t.index ["select_item_1_id"], name: "index_companies_on_select_item_1_id"
    t.index ["select_item_2_id"], name: "index_companies_on_select_item_2_id"
    t.index ["select_item_3_id"], name: "index_companies_on_select_item_3_id"
    t.index ["select_item_4_id"], name: "index_companies_on_select_item_4_id"
    t.index ["select_item_5_id"], name: "index_companies_on_select_item_5_id"
    t.index ["select_item_6_id"], name: "index_companies_on_select_item_6_id"
    t.index ["select_item_7_id"], name: "index_companies_on_select_item_7_id"
    t.index ["select_item_8_id"], name: "index_companies_on_select_item_8_id"
    t.index ["select_item_9_id"], name: "index_companies_on_select_item_9_id"
    t.index ["vendor_group_id"], name: "index_companies_on_vendor_group_id"
  end

  create_table "contracts", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "vendor_group_id", null: false
    t.integer "sales_amount", default: 0, null: false
    t.integer "sales_price_amount", default: 0, null: false
    t.string "uid"
    t.datetime "deleted_at"
    t.string "name"
    t.string "unique_key"
    t.integer "price", default: 0, null: false
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
    t.string "string_6"
    t.string "string_7"
    t.string "string_8"
    t.string "string_9"
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
    t.float "float_1"
    t.float "float_2"
    t.float "float_3"
    t.float "float_4"
    t.float "float_5"
    t.string "calc_1"
    t.string "calc_2"
    t.string "calc_3"
    t.string "calc_4"
    t.string "calc_5"
    t.string "lookup_1"
    t.string "lookup_2"
    t.string "lookup_3"
    t.string "lookup_4"
    t.string "lookup_5"
    t.string "stacked_1"
    t.string "stacked_2"
    t.string "stacked_3"
    t.string "stacked_4"
    t.string "stacked_5"
    t.text "vendor_memo"
    t.text "index_cache"
    t.text "show_cache"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "product_id"
    t.bigint "company_id"
    t.bigint "staff_id"
    t.index ["company_id"], name: "index_contracts_on_company_id"
    t.index ["product_id"], name: "index_contracts_on_product_id"
    t.index ["select_item_10_id"], name: "index_contracts_on_select_item_10_id"
    t.index ["select_item_1_id"], name: "index_contracts_on_select_item_1_id"
    t.index ["select_item_2_id"], name: "index_contracts_on_select_item_2_id"
    t.index ["select_item_3_id"], name: "index_contracts_on_select_item_3_id"
    t.index ["select_item_4_id"], name: "index_contracts_on_select_item_4_id"
    t.index ["select_item_5_id"], name: "index_contracts_on_select_item_5_id"
    t.index ["select_item_6_id"], name: "index_contracts_on_select_item_6_id"
    t.index ["select_item_7_id"], name: "index_contracts_on_select_item_7_id"
    t.index ["select_item_8_id"], name: "index_contracts_on_select_item_8_id"
    t.index ["select_item_9_id"], name: "index_contracts_on_select_item_9_id"
    t.index ["staff_id"], name: "index_contracts_on_staff_id"
    t.index ["vendor_group_id"], name: "index_contracts_on_vendor_group_id"
  end

  create_table "csv_import_histories", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "staff_id"
    t.bigint "vendor_group_id", null: false
    t.integer "related_object", default: 10, null: false
    t.string "file_name"
    t.text "cache"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["staff_id"], name: "index_csv_import_histories_on_staff_id"
    t.index ["vendor_group_id"], name: "index_csv_import_histories_on_vendor_group_id"
  end

  create_table "customers", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "vendor_group_id"
    t.string "uid"
    t.datetime "deleted_at"
    t.string "name"
    t.string "unique_key"
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
    t.string "string_6"
    t.string "string_7"
    t.string "string_8"
    t.string "string_9"
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
    t.float "float_1"
    t.float "float_2"
    t.float "float_3"
    t.float "float_4"
    t.float "float_5"
    t.text "vendor_memo"
    t.text "index_cache"
    t.text "show_cache"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "lead_id"
    t.index ["lead_id"], name: "index_customers_on_lead_id"
    t.index ["select_item_10_id"], name: "index_customers_on_select_item_10_id"
    t.index ["select_item_1_id"], name: "index_customers_on_select_item_1_id"
    t.index ["select_item_2_id"], name: "index_customers_on_select_item_2_id"
    t.index ["select_item_3_id"], name: "index_customers_on_select_item_3_id"
    t.index ["select_item_4_id"], name: "index_customers_on_select_item_4_id"
    t.index ["select_item_5_id"], name: "index_customers_on_select_item_5_id"
    t.index ["select_item_6_id"], name: "index_customers_on_select_item_6_id"
    t.index ["select_item_7_id"], name: "index_customers_on_select_item_7_id"
    t.index ["select_item_8_id"], name: "index_customers_on_select_item_8_id"
    t.index ["select_item_9_id"], name: "index_customers_on_select_item_9_id"
    t.index ["vendor_group_id"], name: "index_customers_on_vendor_group_id"
  end

  create_table "dashboard_layouts", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "dashboard_id", null: false
    t.json "layout"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["dashboard_id"], name: "index_dashboard_layouts_on_dashboard_id"
  end

  create_table "dashboards", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "vendor_group_id", null: false
    t.string "name"
    t.integer "position"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["vendor_group_id"], name: "index_dashboards_on_vendor_group_id"
  end

  create_table "download_file_histories", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "staff_id", null: false
    t.bigint "shared_file_id", null: false
    t.string "uid"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["shared_file_id"], name: "index_download_file_histories_on_shared_file_id"
    t.index ["staff_id"], name: "index_download_file_histories_on_staff_id"
  end

  create_table "gadgets", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "dashboard_id", null: false
    t.string "uid"
    t.string "name"
    t.integer "chart_type", default: 10, null: false
    t.integer "target_table", default: 10, null: false
    t.integer "row_group"
    t.integer "col_group"
    t.bigint "target_column_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["dashboard_id"], name: "index_gadgets_on_dashboard_id"
    t.index ["target_column_id"], name: "index_gadgets_on_target_column_id"
  end

  create_table "lead_phase_products", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "lead_phase_id", null: false
    t.bigint "product_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["lead_phase_id"], name: "index_lead_phase_products_on_lead_phase_id"
    t.index ["product_id"], name: "index_lead_phase_products_on_product_id"
  end

  create_table "lead_phases", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "vendor_group_id", null: false
    t.string "name"
    t.integer "position"
    t.integer "phase_role"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["vendor_group_id"], name: "index_lead_phases_on_vendor_group_id"
  end

  create_table "leads", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "lead_phase_id"
    t.datetime "saled_at"
    t.string "uid"
    t.datetime "deleted_at"
    t.bigint "vendor_group_id", null: false
    t.bigint "company_id"
    t.bigint "product_id"
    t.bigint "contract_id"
    t.bigint "staff_id"
    t.bigint "customer_id"
    t.string "name"
    t.string "unique_key"
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
    t.string "string_6"
    t.string "string_7"
    t.string "string_8"
    t.string "string_9"
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
    t.float "float_1"
    t.float "float_2"
    t.float "float_3"
    t.float "float_4"
    t.float "float_5"
    t.string "calc_1"
    t.string "calc_2"
    t.string "calc_3"
    t.string "calc_4"
    t.string "calc_5"
    t.string "lookup_1"
    t.string "lookup_2"
    t.string "lookup_3"
    t.string "lookup_4"
    t.string "lookup_5"
    t.string "stacked_1"
    t.string "stacked_2"
    t.string "stacked_3"
    t.string "stacked_4"
    t.string "stacked_5"
    t.text "vendor_memo"
    t.text "index_cache"
    t.text "show_cache"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["company_id"], name: "index_leads_on_company_id"
    t.index ["contract_id"], name: "index_leads_on_contract_id"
    t.index ["customer_id"], name: "index_leads_on_customer_id"
    t.index ["lead_phase_id"], name: "index_leads_on_lead_phase_id"
    t.index ["product_id"], name: "index_leads_on_product_id"
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
    t.index ["staff_id"], name: "index_leads_on_staff_id"
    t.index ["unique_key", "product_id"], name: "index_leads_on_unique_key_and_product_id", unique: true
    t.index ["vendor_group_id"], name: "index_leads_on_vendor_group_id"
  end

  create_table "messages", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "board_id", null: false
    t.bigint "staff_id", null: false
    t.text "content"
    t.string "uid"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["board_id"], name: "index_messages_on_board_id"
    t.index ["staff_id"], name: "index_messages_on_staff_id"
  end

  create_table "notification_reads", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "notification_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["notification_id"], name: "index_notification_reads_on_notification_id"
    t.index ["user_id"], name: "index_notification_reads_on_user_id"
  end

  create_table "notifications", charset: "utf8mb4", force: :cascade do |t|
    t.integer "notification_type", null: false
    t.integer "viewable_permission", null: false
    t.integer "login_mode", null: false
    t.integer "link_type", null: false
    t.datetime "published_at", null: false
    t.string "title", null: false
    t.text "message"
    t.bigint "company_id"
    t.bigint "related_user_id"
    t.string "uid", null: false
    t.string "related_object_uid"
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["company_id"], name: "index_notifications_on_company_id"
    t.index ["related_object_uid"], name: "index_notifications_on_related_object_uid"
    t.index ["related_user_id"], name: "index_notifications_on_related_user_id"
    t.index ["uid"], name: "index_notifications_on_uid", unique: true
  end

  create_table "organizations", charset: "utf8mb4", force: :cascade do |t|
    t.string "name"
    t.string "name_kana"
    t.string "coprate_number"
    t.string "postcode"
    t.string "address"
    t.string "address2"
    t.string "phone"
    t.string "image"
    t.string "email"
    t.integer "partnership_type", default: 10, null: false
    t.string "uid"
    t.datetime "deleted_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "products", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "vendor_group_id", null: false
    t.string "image"
    t.string "uid"
    t.datetime "deleted_at"
    t.string "name"
    t.string "unique_key"
    t.integer "price", default: 0, null: false
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
    t.string "string_6"
    t.string "string_7"
    t.string "string_8"
    t.string "string_9"
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
    t.float "float_1"
    t.float "float_2"
    t.float "float_3"
    t.float "float_4"
    t.float "float_5"
    t.string "calc_1"
    t.string "calc_2"
    t.string "calc_3"
    t.string "calc_4"
    t.string "calc_5"
    t.string "lookup_1"
    t.string "lookup_2"
    t.string "lookup_3"
    t.string "lookup_4"
    t.string "lookup_5"
    t.string "stacked_1"
    t.string "stacked_2"
    t.string "stacked_3"
    t.string "stacked_4"
    t.string "stacked_5"
    t.text "vendor_memo"
    t.text "index_cache"
    t.text "show_cache"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "company_id"
    t.bigint "staff_id"
    t.bigint "customer_id"
    t.index ["company_id"], name: "index_products_on_company_id"
    t.index ["customer_id"], name: "index_products_on_customer_id"
    t.index ["select_item_10_id"], name: "index_products_on_select_item_10_id"
    t.index ["select_item_1_id"], name: "index_products_on_select_item_1_id"
    t.index ["select_item_2_id"], name: "index_products_on_select_item_2_id"
    t.index ["select_item_3_id"], name: "index_products_on_select_item_3_id"
    t.index ["select_item_4_id"], name: "index_products_on_select_item_4_id"
    t.index ["select_item_5_id"], name: "index_products_on_select_item_5_id"
    t.index ["select_item_6_id"], name: "index_products_on_select_item_6_id"
    t.index ["select_item_7_id"], name: "index_products_on_select_item_7_id"
    t.index ["select_item_8_id"], name: "index_products_on_select_item_8_id"
    t.index ["select_item_9_id"], name: "index_products_on_select_item_9_id"
    t.index ["staff_id"], name: "index_products_on_staff_id"
    t.index ["vendor_group_id"], name: "index_products_on_vendor_group_id"
  end

  create_table "shared_files", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "vendor_group_id", null: false
    t.bigint "staff_id", null: false
    t.string "uid"
    t.string "file"
    t.string "file_name"
    t.string "name"
    t.string "human_size"
    t.integer "file_size"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["staff_id"], name: "index_shared_files_on_staff_id"
    t.index ["vendor_group_id"], name: "index_shared_files_on_vendor_group_id"
  end

  create_table "staffs", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "vendor_group_id", null: false
    t.bigint "user_id"
    t.string "uid"
    t.datetime "deleted_at"
    t.string "name"
    t.string "unique_key"
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
    t.string "string_6"
    t.string "string_7"
    t.string "string_8"
    t.string "string_9"
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
    t.float "float_1"
    t.float "float_2"
    t.float "float_3"
    t.float "float_4"
    t.float "float_5"
    t.string "calc_1"
    t.string "calc_2"
    t.string "calc_3"
    t.string "calc_4"
    t.string "calc_5"
    t.string "lookup_1"
    t.string "lookup_2"
    t.string "lookup_3"
    t.string "lookup_4"
    t.string "lookup_5"
    t.string "stacked_1"
    t.string "stacked_2"
    t.string "stacked_3"
    t.string "stacked_4"
    t.string "stacked_5"
    t.text "vendor_memo"
    t.text "index_cache"
    t.text "show_cache"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "company_id"
    t.index ["company_id"], name: "index_staffs_on_company_id"
    t.index ["select_item_10_id"], name: "index_staffs_on_select_item_10_id"
    t.index ["select_item_1_id"], name: "index_staffs_on_select_item_1_id"
    t.index ["select_item_2_id"], name: "index_staffs_on_select_item_2_id"
    t.index ["select_item_3_id"], name: "index_staffs_on_select_item_3_id"
    t.index ["select_item_4_id"], name: "index_staffs_on_select_item_4_id"
    t.index ["select_item_5_id"], name: "index_staffs_on_select_item_5_id"
    t.index ["select_item_6_id"], name: "index_staffs_on_select_item_6_id"
    t.index ["select_item_7_id"], name: "index_staffs_on_select_item_7_id"
    t.index ["select_item_8_id"], name: "index_staffs_on_select_item_8_id"
    t.index ["select_item_9_id"], name: "index_staffs_on_select_item_9_id"
    t.index ["user_id"], name: "index_staffs_on_user_id"
    t.index ["vendor_group_id"], name: "index_staffs_on_vendor_group_id"
  end

  create_table "table_column_select_items", charset: "utf8mb4", force: :cascade do |t|
    t.string "uid"
    t.bigint "table_column_id", null: false
    t.string "name"
    t.integer "position"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["table_column_id"], name: "index_table_column_select_items_on_table_column_id"
  end

  create_table "table_columns", charset: "utf8mb4", force: :cascade do |t|
    t.string "uid"
    t.bigint "vendor_group_id", null: false
    t.boolean "default_column", default: false
    t.integer "table_type", default: 10, null: false
    t.integer "data_type", default: 0, null: false
    t.string "name"
    t.string "key_name"
    t.string "table_attribute"
    t.integer "stack_type"
    t.integer "target_table"
    t.bigint "target_column_id"
    t.integer "position", null: false
    t.integer "index_page_position"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["target_column_id"], name: "index_table_columns_on_target_column_id"
    t.index ["vendor_group_id"], name: "index_table_columns_on_vendor_group_id"
  end

  create_table "user_action_permissions", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "organization_id", null: false
    t.bigint "user_action_id", null: false
    t.integer "permit_role"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["organization_id"], name: "index_user_action_permissions_on_organization_id"
    t.index ["user_action_id"], name: "index_user_action_permissions_on_user_action_id"
  end

  create_table "user_actions", charset: "utf8mb4", force: :cascade do |t|
    t.string "ctrl_path"
    t.string "act_path"
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", charset: "utf8mb4", force: :cascade do |t|
    t.string "name"
    t.bigint "organization_id", null: false
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
    t.string "uid"
    t.datetime "deleted_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["organization_id"], name: "index_users_on_organization_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "vendor_groups", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "vendor_organization_id", null: false
    t.string "name"
    t.string "uid"
    t.datetime "deleted_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["vendor_organization_id"], name: "index_vendor_groups_on_vendor_organization_id"
  end

  add_foreign_key "boards", "vendor_groups"
  add_foreign_key "companies", "companies", column: "parent_id"
  add_foreign_key "companies", "table_column_select_items", column: "select_item_10_id"
  add_foreign_key "companies", "table_column_select_items", column: "select_item_1_id"
  add_foreign_key "companies", "table_column_select_items", column: "select_item_2_id"
  add_foreign_key "companies", "table_column_select_items", column: "select_item_3_id"
  add_foreign_key "companies", "table_column_select_items", column: "select_item_4_id"
  add_foreign_key "companies", "table_column_select_items", column: "select_item_5_id"
  add_foreign_key "companies", "table_column_select_items", column: "select_item_6_id"
  add_foreign_key "companies", "table_column_select_items", column: "select_item_7_id"
  add_foreign_key "companies", "table_column_select_items", column: "select_item_8_id"
  add_foreign_key "companies", "table_column_select_items", column: "select_item_9_id"
  add_foreign_key "companies", "vendor_groups"
  add_foreign_key "contracts", "companies"
  add_foreign_key "contracts", "products"
  add_foreign_key "contracts", "staffs"
  add_foreign_key "contracts", "table_column_select_items", column: "select_item_10_id"
  add_foreign_key "contracts", "table_column_select_items", column: "select_item_1_id"
  add_foreign_key "contracts", "table_column_select_items", column: "select_item_2_id"
  add_foreign_key "contracts", "table_column_select_items", column: "select_item_3_id"
  add_foreign_key "contracts", "table_column_select_items", column: "select_item_4_id"
  add_foreign_key "contracts", "table_column_select_items", column: "select_item_5_id"
  add_foreign_key "contracts", "table_column_select_items", column: "select_item_6_id"
  add_foreign_key "contracts", "table_column_select_items", column: "select_item_7_id"
  add_foreign_key "contracts", "table_column_select_items", column: "select_item_8_id"
  add_foreign_key "contracts", "table_column_select_items", column: "select_item_9_id"
  add_foreign_key "contracts", "vendor_groups"
  add_foreign_key "csv_import_histories", "staffs"
  add_foreign_key "csv_import_histories", "vendor_groups"
  add_foreign_key "customers", "leads"
  add_foreign_key "customers", "table_column_select_items", column: "select_item_10_id"
  add_foreign_key "customers", "table_column_select_items", column: "select_item_1_id"
  add_foreign_key "customers", "table_column_select_items", column: "select_item_2_id"
  add_foreign_key "customers", "table_column_select_items", column: "select_item_3_id"
  add_foreign_key "customers", "table_column_select_items", column: "select_item_4_id"
  add_foreign_key "customers", "table_column_select_items", column: "select_item_5_id"
  add_foreign_key "customers", "table_column_select_items", column: "select_item_6_id"
  add_foreign_key "customers", "table_column_select_items", column: "select_item_7_id"
  add_foreign_key "customers", "table_column_select_items", column: "select_item_8_id"
  add_foreign_key "customers", "table_column_select_items", column: "select_item_9_id"
  add_foreign_key "dashboard_layouts", "dashboards"
  add_foreign_key "dashboards", "vendor_groups"
  add_foreign_key "download_file_histories", "shared_files"
  add_foreign_key "download_file_histories", "staffs"
  add_foreign_key "gadgets", "dashboards"
  add_foreign_key "gadgets", "table_columns", column: "target_column_id"
  add_foreign_key "lead_phase_products", "lead_phases"
  add_foreign_key "lead_phase_products", "products"
  add_foreign_key "lead_phases", "vendor_groups"
  add_foreign_key "leads", "companies"
  add_foreign_key "leads", "contracts"
  add_foreign_key "leads", "customers"
  add_foreign_key "leads", "lead_phases"
  add_foreign_key "leads", "products"
  add_foreign_key "leads", "staffs"
  add_foreign_key "leads", "table_column_select_items", column: "select_item_10_id"
  add_foreign_key "leads", "table_column_select_items", column: "select_item_1_id"
  add_foreign_key "leads", "table_column_select_items", column: "select_item_2_id"
  add_foreign_key "leads", "table_column_select_items", column: "select_item_3_id"
  add_foreign_key "leads", "table_column_select_items", column: "select_item_4_id"
  add_foreign_key "leads", "table_column_select_items", column: "select_item_5_id"
  add_foreign_key "leads", "table_column_select_items", column: "select_item_6_id"
  add_foreign_key "leads", "table_column_select_items", column: "select_item_7_id"
  add_foreign_key "leads", "table_column_select_items", column: "select_item_8_id"
  add_foreign_key "leads", "table_column_select_items", column: "select_item_9_id"
  add_foreign_key "leads", "vendor_groups"
  add_foreign_key "messages", "boards"
  add_foreign_key "messages", "staffs"
  add_foreign_key "notification_reads", "notifications"
  add_foreign_key "notification_reads", "users"
  add_foreign_key "notifications", "companies"
  add_foreign_key "notifications", "users", column: "related_user_id"
  add_foreign_key "products", "companies"
  add_foreign_key "products", "customers"
  add_foreign_key "products", "staffs"
  add_foreign_key "products", "table_column_select_items", column: "select_item_10_id"
  add_foreign_key "products", "table_column_select_items", column: "select_item_1_id"
  add_foreign_key "products", "table_column_select_items", column: "select_item_2_id"
  add_foreign_key "products", "table_column_select_items", column: "select_item_3_id"
  add_foreign_key "products", "table_column_select_items", column: "select_item_4_id"
  add_foreign_key "products", "table_column_select_items", column: "select_item_5_id"
  add_foreign_key "products", "table_column_select_items", column: "select_item_6_id"
  add_foreign_key "products", "table_column_select_items", column: "select_item_7_id"
  add_foreign_key "products", "table_column_select_items", column: "select_item_8_id"
  add_foreign_key "products", "table_column_select_items", column: "select_item_9_id"
  add_foreign_key "products", "vendor_groups"
  add_foreign_key "shared_files", "staffs"
  add_foreign_key "shared_files", "vendor_groups"
  add_foreign_key "staffs", "companies"
  add_foreign_key "staffs", "table_column_select_items", column: "select_item_10_id"
  add_foreign_key "staffs", "table_column_select_items", column: "select_item_1_id"
  add_foreign_key "staffs", "table_column_select_items", column: "select_item_2_id"
  add_foreign_key "staffs", "table_column_select_items", column: "select_item_3_id"
  add_foreign_key "staffs", "table_column_select_items", column: "select_item_4_id"
  add_foreign_key "staffs", "table_column_select_items", column: "select_item_5_id"
  add_foreign_key "staffs", "table_column_select_items", column: "select_item_6_id"
  add_foreign_key "staffs", "table_column_select_items", column: "select_item_7_id"
  add_foreign_key "staffs", "table_column_select_items", column: "select_item_8_id"
  add_foreign_key "staffs", "table_column_select_items", column: "select_item_9_id"
  add_foreign_key "staffs", "users"
  add_foreign_key "staffs", "vendor_groups"
  add_foreign_key "table_column_select_items", "table_columns"
  add_foreign_key "table_columns", "table_columns", column: "target_column_id"
  add_foreign_key "table_columns", "vendor_groups"
  add_foreign_key "user_action_permissions", "organizations"
  add_foreign_key "user_action_permissions", "user_actions"
  add_foreign_key "users", "organizations"
  add_foreign_key "vendor_groups", "organizations", column: "vendor_organization_id"
end
