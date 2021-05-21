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

ActiveRecord::Schema.define(version: 2021_05_20_085618) do

  create_table "agent_products", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "maker_group_id", null: false
    t.bigint "vendor_group_id", null: false
    t.bigint "agent_id", null: false
    t.bigint "product_id", null: false
    t.integer "price"
    t.integer "incentive"
    t.integer "status", default: 10, null: false
    t.string "uid"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["agent_id"], name: "index_agent_products_on_agent_id"
    t.index ["maker_group_id"], name: "index_agent_products_on_maker_group_id"
    t.index ["product_id"], name: "index_agent_products_on_product_id"
    t.index ["vendor_group_id"], name: "index_agent_products_on_vendor_group_id"
  end

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

  create_table "default_labels", charset: "utf8mb4", force: :cascade do |t|
    t.integer "order"
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
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

  create_table "index_columns", charset: "utf8mb4", force: :cascade do |t|
    t.string "name"
    t.string "lead_column"
    t.bigint "product_id", null: false
    t.integer "contract_type", default: 10, null: false
    t.integer "data_type", default: 10, null: false
    t.bigint "lead_category_id"
    t.integer "order", default: 1, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["lead_category_id"], name: "index_index_columns_on_lead_category_id"
    t.index ["product_id"], name: "index_index_columns_on_product_id"
  end

  create_table "lead_caches", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "lead_id", null: false
    t.bigint "maker_group_id", null: false
    t.text "index_cache"
    t.text "show_cache"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["lead_id"], name: "index_lead_caches_on_lead_id"
    t.index ["maker_group_id"], name: "index_lead_caches_on_maker_group_id"
  end

  create_table "lead_categories", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "maker_group_id", null: false
    t.bigint "product_id", null: false
    t.string "name"
    t.string "slug"
    t.integer "order"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["maker_group_id"], name: "index_lead_categories_on_maker_group_id"
    t.index ["product_id"], name: "index_lead_categories_on_product_id"
  end

  create_table "lead_category_items", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "lead_category_id", null: false
    t.string "name"
    t.string "slug"
    t.integer "order"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["lead_category_id"], name: "index_lead_category_items_on_lead_category_id"
  end

  create_table "lead_index_columns", charset: "utf8mb4", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "lead_index_labels", charset: "utf8mb4", force: :cascade do |t|
    t.string "name"
    t.string "lead_column"
    t.bigint "product_id", null: false
    t.integer "contract_type", default: 10, null: false
    t.integer "data_type", default: 10, null: false
    t.bigint "lead_category_id"
    t.integer "order", default: 1, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["lead_category_id"], name: "index_lead_index_labels_on_lead_category_id"
    t.index ["product_id"], name: "index_lead_index_labels_on_product_id"
  end

  create_table "lead_raw_labels", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "maker_group_id", null: false
    t.bigint "product_id", null: false
    t.integer "contract_type", default: 10, null: false
    t.string "col_aa"
    t.string "col_ab"
    t.string "col_ac"
    t.string "col_ad"
    t.string "col_ae"
    t.string "col_af"
    t.string "col_ag"
    t.string "col_ah"
    t.string "col_ai"
    t.string "col_aj"
    t.string "col_ak"
    t.string "col_al"
    t.string "col_am"
    t.string "col_an"
    t.string "col_ao"
    t.string "col_ap"
    t.string "col_aq"
    t.string "col_ar"
    t.string "col_as"
    t.string "col_at"
    t.string "col_au"
    t.string "col_av"
    t.string "col_aw"
    t.string "col_ax"
    t.string "col_ay"
    t.string "col_az"
    t.string "col_ba"
    t.string "col_bb"
    t.string "col_bc"
    t.string "col_bd"
    t.string "col_be"
    t.string "col_bf"
    t.string "col_bg"
    t.string "col_bh"
    t.string "col_bi"
    t.string "col_bj"
    t.string "col_bk"
    t.string "col_bl"
    t.string "col_bm"
    t.string "col_bn"
    t.string "col_bo"
    t.string "col_bp"
    t.string "col_bq"
    t.string "col_br"
    t.string "col_bs"
    t.string "col_bt"
    t.string "col_bu"
    t.string "col_bv"
    t.string "col_bw"
    t.string "col_bx"
    t.string "col_by"
    t.string "col_bz"
    t.string "col_ca"
    t.string "col_cb"
    t.string "col_cc"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["maker_group_id"], name: "index_lead_raw_labels_on_maker_group_id"
    t.index ["product_id"], name: "index_lead_raw_labels_on_product_id"
  end

  create_table "lead_raws", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "maker_group_id", null: false
    t.bigint "product_id", null: false
    t.bigint "partner_id", null: false
    t.string "col_aa"
    t.string "col_ab"
    t.string "col_ac"
    t.string "col_ad"
    t.string "col_ae"
    t.string "col_af"
    t.string "col_ag"
    t.string "col_ah"
    t.string "col_ai"
    t.string "col_aj"
    t.string "col_ak"
    t.string "col_al"
    t.string "col_am"
    t.string "col_an"
    t.string "col_ao"
    t.string "col_ap"
    t.string "col_aq"
    t.string "col_ar"
    t.string "col_as"
    t.string "col_at"
    t.string "col_au"
    t.string "col_av"
    t.string "col_aw"
    t.string "col_ax"
    t.string "col_ay"
    t.string "col_az"
    t.string "col_ba"
    t.string "col_bb"
    t.string "col_bc"
    t.string "col_bd"
    t.string "col_be"
    t.string "col_bf"
    t.string "col_bg"
    t.string "col_bh"
    t.string "col_bi"
    t.string "col_bj"
    t.string "col_bk"
    t.string "col_bl"
    t.string "col_bm"
    t.string "col_bn"
    t.string "col_bo"
    t.string "col_bp"
    t.string "col_bq"
    t.string "col_br"
    t.string "col_bs"
    t.string "col_bt"
    t.string "col_bu"
    t.string "col_bv"
    t.string "col_bw"
    t.string "col_bx"
    t.string "col_by"
    t.string "col_bz"
    t.string "col_ca"
    t.string "col_cb"
    t.string "col_cc"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["maker_group_id"], name: "index_lead_raws_on_maker_group_id"
    t.index ["partner_id"], name: "index_lead_raws_on_partner_id"
    t.index ["product_id"], name: "index_lead_raws_on_product_id"
  end

  create_table "leads", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "maker_group_id", null: false
    t.bigint "partner_id"
    t.bigint "product_id"
    t.integer "contract_type", default: 10, null: false
    t.integer "progress"
    t.text "index_cache"
    t.text "show_cache"
    t.bigint "category_1_id"
    t.bigint "category_2_id"
    t.bigint "category_3_id"
    t.bigint "category_4_id"
    t.bigint "category_5_id"
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
    t.bigint "prefecture_1_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["category_1_id"], name: "index_leads_on_category_1_id"
    t.index ["category_2_id"], name: "index_leads_on_category_2_id"
    t.index ["category_3_id"], name: "index_leads_on_category_3_id"
    t.index ["category_4_id"], name: "index_leads_on_category_4_id"
    t.index ["category_5_id"], name: "index_leads_on_category_5_id"
    t.index ["maker_group_id"], name: "index_leads_on_maker_group_id"
    t.index ["partner_id"], name: "index_leads_on_partner_id"
    t.index ["prefecture_1_id"], name: "index_leads_on_prefecture_1_id"
    t.index ["product_id"], name: "index_leads_on_product_id"
    t.index ["progress"], name: "index_leads_on_progress"
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

  create_table "maker_informations", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "maker_group_id", null: false
    t.string "title"
    t.text "content"
    t.bigint "user_id", null: false
    t.integer "status", default: 10, null: false
    t.string "uid"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["maker_group_id"], name: "index_maker_informations_on_maker_group_id"
    t.index ["user_id"], name: "index_maker_informations_on_user_id"
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

  create_table "offer_metas", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "offer_id", null: false
    t.string "meta_key"
    t.string "meta_label"
    t.string "meta_value"
    t.integer "order"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["offer_id"], name: "index_offer_metas_on_offer_id"
  end

  create_table "offers", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "maker_group_id", null: false
    t.bigint "vendor_group_id", null: false
    t.bigint "agent_id", null: false
    t.bigint "product_id", null: false
    t.bigint "user_id"
    t.integer "type"
    t.datetime "saled_at"
    t.datetime "confirmed_at"
    t.integer "progress"
    t.string "unique_key"
    t.integer "status", default: 10, null: false
    t.string "uid"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["agent_id"], name: "index_offers_on_agent_id"
    t.index ["maker_group_id"], name: "index_offers_on_maker_group_id"
    t.index ["product_id"], name: "index_offers_on_product_id"
    t.index ["user_id"], name: "index_offers_on_user_id"
    t.index ["vendor_group_id"], name: "index_offers_on_vendor_group_id"
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

  create_table "product_labels", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "product_id", null: false
    t.integer "order"
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["product_id"], name: "index_product_labels_on_product_id"
  end

  create_table "product_metas", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "product_id", null: false
    t.string "meta_key"
    t.string "meta_label"
    t.string "meta_type"
    t.integer "order"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["product_id"], name: "index_product_metas_on_product_id"
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
    t.string "title"
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

  create_table "vendor_informations", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "maker_group_id", null: false
    t.bigint "vendor_group_id", null: false
    t.string "title"
    t.text "content"
    t.bigint "user_id", null: false
    t.integer "status", default: 10, null: false
    t.string "uid"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["maker_group_id"], name: "index_vendor_informations_on_maker_group_id"
    t.index ["user_id"], name: "index_vendor_informations_on_user_id"
    t.index ["vendor_group_id"], name: "index_vendor_informations_on_vendor_group_id"
  end

  create_table "vendor_products", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "maker_group_id", null: false
    t.bigint "vendor_group_id", null: false
    t.bigint "product_id", null: false
    t.integer "price"
    t.integer "incentive"
    t.integer "status", default: 10, null: false
    t.string "uid"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["maker_group_id"], name: "index_vendor_products_on_maker_group_id"
    t.index ["product_id"], name: "index_vendor_products_on_product_id"
    t.index ["vendor_group_id"], name: "index_vendor_products_on_vendor_group_id"
  end

  add_foreign_key "agent_products", "agents"
  add_foreign_key "agent_products", "maker_groups"
  add_foreign_key "agent_products", "products"
  add_foreign_key "agent_products", "vendor_groups"
  add_foreign_key "agents", "companies"
  add_foreign_key "agents", "companies", column: "parent_id"
  add_foreign_key "agents", "maker_groups"
  add_foreign_key "agents", "vendor_groups"
  add_foreign_key "companies", "prefectures"
  add_foreign_key "download_file_histories", "shared_files"
  add_foreign_key "download_file_histories", "users"
  add_foreign_key "index_columns", "lead_categories"
  add_foreign_key "index_columns", "products"
  add_foreign_key "lead_caches", "leads"
  add_foreign_key "lead_caches", "maker_groups"
  add_foreign_key "lead_categories", "maker_groups"
  add_foreign_key "lead_categories", "products"
  add_foreign_key "lead_category_items", "lead_categories"
  add_foreign_key "lead_index_labels", "lead_categories"
  add_foreign_key "lead_index_labels", "products"
  add_foreign_key "lead_raw_labels", "maker_groups"
  add_foreign_key "lead_raw_labels", "products"
  add_foreign_key "lead_raws", "maker_groups"
  add_foreign_key "lead_raws", "partners"
  add_foreign_key "lead_raws", "products"
  add_foreign_key "leads", "lead_category_items", column: "category_1_id"
  add_foreign_key "leads", "lead_category_items", column: "category_2_id"
  add_foreign_key "leads", "lead_category_items", column: "category_3_id"
  add_foreign_key "leads", "lead_category_items", column: "category_4_id"
  add_foreign_key "leads", "lead_category_items", column: "category_5_id"
  add_foreign_key "leads", "maker_groups"
  add_foreign_key "leads", "partners"
  add_foreign_key "leads", "prefectures", column: "prefecture_1_id"
  add_foreign_key "leads", "products"
  add_foreign_key "maker_groups", "companies", column: "maker_id"
  add_foreign_key "maker_informations", "maker_groups"
  add_foreign_key "maker_informations", "users"
  add_foreign_key "messages", "boards"
  add_foreign_key "messages", "users"
  add_foreign_key "offer_metas", "offers"
  add_foreign_key "offers", "agents"
  add_foreign_key "offers", "maker_groups"
  add_foreign_key "offers", "products"
  add_foreign_key "offers", "users"
  add_foreign_key "offers", "vendor_groups"
  add_foreign_key "partners", "maker_groups"
  add_foreign_key "partners", "partners", column: "parent_id"
  add_foreign_key "product_labels", "products"
  add_foreign_key "product_metas", "products"
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
  add_foreign_key "vendor_informations", "maker_groups"
  add_foreign_key "vendor_informations", "users"
  add_foreign_key "vendor_informations", "vendor_groups"
  add_foreign_key "vendor_products", "maker_groups"
  add_foreign_key "vendor_products", "products"
  add_foreign_key "vendor_products", "vendor_groups"
end
