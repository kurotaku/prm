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

ActiveRecord::Schema.define(version: 2021_05_07_022555) do

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
    t.bigint "company_id", null: false
    t.integer "hierarchy"
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
    t.integer "price"
    t.integer "incentive"
    t.text "description"
    t.integer "status", default: 10, null: false
    t.string "uid"
    t.datetime "deleted_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["maker_group_id"], name: "index_products_on_maker_group_id"
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
    t.integer "layer"
    t.integer "status", default: 10, null: false
    t.string "uid"
    t.datetime "deleted_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["maker_group_id"], name: "index_vendor_groups_on_maker_group_id"
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
  add_foreign_key "partners", "companies"
  add_foreign_key "partners", "companies", column: "parent_id"
  add_foreign_key "partners", "maker_groups"
  add_foreign_key "product_labels", "products"
  add_foreign_key "product_metas", "products"
  add_foreign_key "products", "maker_groups"
  add_foreign_key "user_action_permissions", "companies"
  add_foreign_key "user_action_permissions", "user_actions"
  add_foreign_key "user_profiles", "companies"
  add_foreign_key "user_profiles", "users"
  add_foreign_key "users", "companies"
  add_foreign_key "vendor_groups", "companies", column: "vendor_id"
  add_foreign_key "vendor_groups", "maker_groups"
  add_foreign_key "vendor_informations", "maker_groups"
  add_foreign_key "vendor_informations", "users"
  add_foreign_key "vendor_informations", "vendor_groups"
  add_foreign_key "vendor_products", "maker_groups"
  add_foreign_key "vendor_products", "products"
  add_foreign_key "vendor_products", "vendor_groups"
end
