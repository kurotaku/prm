# frozen_string_literal: true

########
# rails r db/seeds/mf.rb
########

ApplicationRecord.transaction do
  ##########################
  # 組織
  ##########################
  p "=== Organization ==="
  mf_organization = Organization.find_or_create_by!(name: "\u682A\u5F0F\u4F1A\u793E\u30DE\u30CD\u30FC\u30D5\u30A9\u30EF\u30FC\u30C9", postcode: "108-0023", address: "\u90FD\u5185\u67D0\u6240", partnership_type: 20)

  mf_partner_orgs = []
  mf_partner_orgs << Organization.find_or_create_by!(name: "\u30E9\u30A4\u30D5\u30B9\u30BF\u30A4\u30EB\u682A\u5F0F\u4F1A\u793E", postcode: "150-0001", address: "\u90FD\u5185\u67D0\u6240")
  mf_partner_orgs << Organization.find_or_create_by!(name: "\u30D1\u30FC\u30C8\u30CA\u30FCB", postcode: "150-0001", address: "\u90FD\u5185\u67D0\u6240")
  mf_partner_orgs << Organization.find_or_create_by!(name: "\u30D1\u30FC\u30C8\u30CA\u30FCC", postcode: "330-0856", address: "\u5927\u5BAE\u67D0\u6240")
  mf_partner_orgs << Organization.find_or_create_by!(name: "\u30D1\u30FC\u30C8\u30CA\u30FCD", postcode: "150-0001", address: "\u90FD\u5185\u67D0\u6240")
  mf_partner_orgs << Organization.find_or_create_by!(name: "\u30D1\u30FC\u30C8\u30CA\u30FCE", postcode: "150-0001", address: "\u90FD\u5185\u67D0\u6240")
  mf_partner_orgs << Organization.find_or_create_by!(name: "\u30D1\u30FC\u30C8\u30CA\u30FCF", postcode: "150-0001", address: "\u90FD\u5185\u67D0\u6240")
  mf_partner_orgs << Organization.find_or_create_by!(name: "\u30D1\u30FC\u30C8\u30CA\u30FCG", postcode: "150-0001", address: "\u90FD\u5185\u67D0\u6240")

  ##########################
  # ユーザー
  ##########################
  def dumy_force_create(organization, email, name)
    user = organization.users.new(name: name, email: email, password: "password", role: 20)
    user.skip_confirmation!
    user.save!
    user
  end

  p "=== User ==="
  vendor_organization_user_1 = dumy_force_create(mf_organization, "sample@mf.com", "\u30DE\u30CD\u30D5\u30A9\u592A\u90CE")

  dumy_force_create(mf_partner_orgs[0], "sample@ls.com", "\u30E9\u30A4\u30D5\u592A\u90CE")
  dumy_force_create(mf_partner_orgs[0], "sample1@ls.com", "\u30E9\u30A4\u30D5\u4E8C\u90CE")
  dumy_force_create(mf_partner_orgs[0], "sample2@ls.com", "\u30E9\u30A4\u30D5\u4E09\u90CE")

  ##########################
  # ベンダーグループ
  ##########################
  p "=== VendorGroup ==="
  mf_group = VendorGroup.create!(vendor_organization: mf_organization)

  ##########################
  # 企業
  ##########################
  p "=== Company ==="
  mf = mf_group.companies.create!(organization: mf_organization, name: mf_organization.name, hierarchy: 1, partnership_type: "vendor")

  mf_partner_orgs.each do |org|
    mf_group.companies.create!(organization: org, name: org.name, hierarchy: 1)
  end

  ##########################
  # スタッフ
  ##########################
  p "=== Staff ==="

  last_name = %w[佐藤 鈴木 木村 渡辺 加藤 斎藤 近藤 高橋 田中 伊藤 山本 中村 小林 山田 佐々木 井上 林]
  first_name = %w[太郎 一郎 花子 よし子 優子 健 太一 二郎 真司 剛 翔太 はるか 綾香 美咲 さくら]

  mf_group.companies.each do |company|
    company.organization.users.each do |user|
      mf_group.staffs.create!(company: company, user: user, name: user.name)
    end
    5.times do
      mf_group.staffs.create(name: last_name.sample + " " + first_name.sample, company: company)
    end
  end

  ##########################
  # 商品
  ##########################
  p "=== Product ==="
  product_1 = mf_group.products.create!(name: "\u52E4\u6020", unique_key: "m-0001", price: 8_000)
  product_2 = mf_group.products.create!(name: "\u7D4C\u8CBB", unique_key: "m-0002", price: 200_000)
  product_3 = mf_group.products.create!(name: "\u7D66\u4E0E", unique_key: "m-0003", price: 110_000)
  product_4 = mf_group.products.create!(name: "\u4F1A\u8A08Plus", unique_key: "m-0003", price: 10_000)

  ##########################
  # 商談のフェイズ
  ##########################
  p "=== LeadPhase ==="

  phase_array = [
    "01.\u6A5F\u4F1A\u3092\u660E\u3089\u304B\u306B\u3059\u308B",
    "\u30EA\u30B5\u30A4\u30AF\u30EBB",
    "\u30EA\u30B5\u30A4\u30AF\u30EBA",
    "02.\u554F\u984C\u30FB\u52B9\u679C\u30FB\u7406\u60F3\u306E\u767A\u898B",
    "03.\u30E1\u30EA\u30C3\u30C8\u3068\u4FA1\u5024\u306E\u691C\u8A3C",
    "04.\u610F\u601D\u6C7A\u5B9A\u8005\u306B\u4FA1\u5024\u3092\u660E\u793A",
    "05.\u4EA4\u6E09\u3059\u308B",
    "06.\u5951\u7D04\u7DE0\u7D50\u306B\u5411\u3051\u305F\u6700\u7D42\u8ABF\u6574",
    "06.\u5C0E\u5165\u6642\u671F or \u91D1\u984D\u306E\u8ABF\u6574\u4E2D",
    "NG \u30AF\u30E9\u30A6\u30C9\u4E0D\u53EF/\u50B5\u52D9\u30CB\u30FC\u30BA\u306A\u3057AU5\u540D\u4EE5\u4E0B/\u30E1\u30A2\u30C9\u7121\u3057",
    "21.\u5951\u7D04\u66F4\u65B0\u78BA\u8A8D",
    "22.\u89E3\u7D04\u898B\u8FBC\u307F",
    "23.\u30C0\u30A6\u30F3\u30B0\u30EC\u30FC\u30C9\u898B\u8FBC\u307F",
    "49.\u88DC\u52A9\u91D1\u5C02\u7528",
    "50.\u96FB\u5B50\u5951\u7D04\u9001\u4ED8",
    "51.\u671F\u4E2D\u30A2\u30C3\u30D7\u30B0\u30EC\u30FC\u30C9\u899A\u66F8\u9001\u4ED8",
    "52.\u7533\u8FBC\u66F8\u56DE\u53CE\u5F85\u3061",
    "53.\u7D0D\u54C1\u4F9D\u983C\u4E2D",
    "54.\u7533\u8FBC\u53D7\u9818\u5B8C\u4E86",
    "58.\u30AF\u30EC\u30AB\u5B9F\u7E3E",
    "59.\u5B8C\u4E86\uFF08\u7D0D\u54C1\u306A\u3057\uFF09",
    "60.\u4ED6\u793ESaaS\u7D0D\u54C1\u524D\u30C1\u30A7\u30C3\u30AF",
    "81.\u4E88\u7B97",
    "82.\u30DE\u30FC\u30B1\u30D5\u30A9\u30ED\u30FC",
    "83.SG\u671F\u9593\u7121\u6599\u5EF6\u9577",
    "91.\u4E0D\u6210\u7ACB",
    "99.\u305D\u306E\u4ED6",
    "Dead-Lost"
  ]

  phase_array.each do |phase|
    mf_group.lead_phases.create!(name: phase)
  end

  phase = LeadPhase.find_by(name: "59.\u5B8C\u4E86\uFF08\u7D0D\u54C1\u306A\u3057\uFF09")
  phase.phase_role = "saled"
  phase.save!

  ##########################
  # 商談のフェイズと商品の割り当て
  ##########################
  p "=== LeadPhaseProduct ==="

  mf_group.lead_phases.each do |lead_phase|
    mf_group.products.each do |product|
      LeadPhaseProduct.create(lead_phase: lead_phase, product: product)
    end
  end

  ##########################
  # オブジェクトの項目
  ##########################
  p "=== TableColumn ==="
  p "LeadColumn"

  mf_group.table_columns.create!(table_type: "lead", index_page_position: 9, name: "\u7533\u8ACB\u65E5\uFF08\u30E1\u30FC\u30EB\u53D7\u4FE1\u65E5\uFF09", key_name: "apply_date", data_type: :datetime)
  mf_group.table_columns.create!(table_type: "lead", index_page_position: 10, name: "\u67B6\u96FB\u5C65\u6B74()", key_name: "tel_history", data_type: :text)
  mf_group.table_columns.create!(table_type: "lead", index_page_position: 11, name: "\u6B21\u56DE\u30A2\u30AF\u30B7\u30E7\u30F3\u65E5", key_name: "next_action_date", data_type: :datetime)
  mf_group.table_columns.create!(table_type: "lead", index_page_position: 12, name: "\u5BFE\u5FDC\u505C\u6B62\u7406\u7531\u8A73\u7D30\uFF08\u30D1\u30FC\u30C8\u30CA\u30FC\u7528\uFF09", key_name: "cansele_reason", data_type: :string)
  mf_group.table_columns.create!(table_type: "lead", index_page_position: 13, name: "\u30A2\u30DD\u7372\u5F97\u65E5", key_name: "apo_date", data_type: :datetime)
  mf_group.table_columns.create!(table_type: "lead", index_page_position: 14, name: "\u5546\u8AC7\u4E88\u5B9A\u65E5\u6642", key_name: "customer_meeting_date", data_type: :datetime)
  mf_group.table_columns.create!(table_type: "lead", index_page_position: 15, name: "\u5F93\u696D\u54E1", key_name: "number_of_employees", data_type: :integer)

  price = mf_group.table_columns.create!(table_type: "lead", index_page_position: 16, name: "\u58F2\u308A\u4E0A\u3052", key_name: "salse_price", data_type: :integer)

  column_1 = mf_group.table_columns.create!(table_type: "lead", index_page_position: 16, name: "\uFF08\u7D4C\u8CBB\uFF09\u30A2\u30DD\u53D6\u5F97\u72B6\u6CC1", key_name: "keihi_apo", data_type: :select_item)
  [
    "3_\u6848\u4EF6\u5316",
    "2_\u672A\u63A5\u7D9A",
    "2_\u8A55\u4FA1D_IS\u30D5\u30A9\u30ED\u30FC\u7D42\u4E86(MK\u30D5\u30A9\u30ED\u30FC)",
    "2_\u8A55\u4FA1C",
    "2_\u8A55\u4FA1B",
    "2_\u8A55\u4FA1A",
    "2_\u4ED6\u90E8\u7F72\u9023\u643A\u5F85\u3061",
    "1_1_\u65B0\u898F_\u512A\u5148",
    "1_2_\u65B0\u898F_\u5E73\u5E38",
    "XX_\u914D\u4FE1\u5BFE\u8C61\u5916(\u5F37\u3044\u62D2\u5426\u3001\u7AF6\u5408\u7B49)",
    "XX.\u91CD\u8907_\u53D6\u5F15\u5148",
    "XX.\u91CD\u8907_\u30EA\u30FC\u30C9",
    "XX.\u91CD\u8907_\u5229\u7528\u4E2D",
    "XX_\u53D6\u6B21_PB \u90E8\u78BA\u8A8D\u4F9D\u983C\u4E2D",
    "4_MQL(MK\u304B\u3089\u306E\u30D1\u30B9)"
  ].each_with_index do |n, i|
    column_1.table_column_select_items.create!(name: n, position: i + 1)
  end

  column_2 = mf_group.table_columns.create!(table_type: "lead", index_page_position: 17, name: "\uFF08\u7D66\u4E0E\u52E4\u6020\uFF09\u30A2\u30DD\u53D6\u5F97\u72B6\u6CC1", key_name: "kintai_apo", data_type: :select_item)
  [
    "00.\u30CA\u30FC\u30C1\u30E3\u30EA\u30F3\u30B0",
    "01.\u65B0\u898F",
    "01.\u30EA\u30B5\u30A4\u30AF\u30EB",
    "02.\u672A\u63A5\u89E6",
    "03.\u5BFE\u5FDC\u4E2D",
    "03.\u65E5\u7A0B\u8ABF\u6574\u4E2D",
    "03.\u4ED6\u90E8\u7F72\u9023\u643A\u5F85\u3061",
    "04.\u6848\u4EF6\u5316",
    "XX.\u91CD\u8907_\u30EA\u30FC\u30C9",
    "XX.\u91CD\u8907_\u53D6\u5F15\u5148",
    "XX.\u91CD\u8907_\u5229\u7528\u4E2D",
    "XX.\u67B6\u96FB\u5BFE\u8C61\u5916",
    "XX.\u67B6\u96FB\u5BFE\u8C61\u5916_\u96FB\u8A71\u756A\u53F7\u9593\u9055\u3044",
    "\u4EEE dead"
  ].each_with_index do |n, i|
    column_2.table_column_select_items.create!(name: n, position: i + 1)
  end

  column_3 = mf_group.table_columns.create!(table_type: "lead", index_page_position: 18, name: "\uFF08\u4F1A\u8A08Plus\uFF09\u30A2\u30DD\u53D6\u5F97\u72B6\u6CC1", key_name: "kaikei_apo", data_type: :select_item)
  [
    "00.\u518D\u30A2\u30D7\u30ED\u30FC\u30C1",
    "01.\u65B0\u898F",
    "02.\u67B6\u96FB\u5BFE\u8C61\u5916\uFF08\u30B3\u30F3\u30BF\u30AF\u30C8\u4E0D\u53EF\uFF09",
    "02.\u5BFE\u5FDC\u4E2D",
    "03.\u30CA\u30FC\u30C1\u30E3\u30EA\u30F3\u30B0_\u9AD8",
    "03.\u30CA\u30FC\u30C1\u30E3\u30EA\u30F3\u30B0_\u4F4E",
    "03.\u30CA\u30FC\u30C1\u30E3\u30EA\u30F3\u30B0_\u9577\u671F",
    "03.\u4ED6\u90E8\u7F72\u9023\u643A\u5F85\u3061",
    "05.Dead(\u6642\u671F\u65E9\u3005)",
    "05.Dead(\u30CB\u30FC\u30BA\u7121\u3057)",
    "05.Dead(\u4ED6\u793E\u6C7A\u5B9A\u6E08\u307F)",
    "05.Dead(\u305D\u306E\u4ED6)",
    "06.\u53D6\u5F15\u958B\u59CB\u6E08\u307F",
    "00.\u793E\u5916IS",
    "xx.\u91CD\u8907_\u30EA\u30FC\u30C9",
    "xx.\u91CD\u8907_\u53D6\u5F15\u5148",
    "xx.\u91CD\u8907_\u5229\u7528\u4E2D",
    "xx.\u58EB\u696D/\u30B3\u30F3\u30B5\u30EB/\u91D1\u878D\u6A5F\u95A2/\u4EE3\u7406\u5E97",
    "xx.SMB\u5BFE\u8C61\uFF0830\u540D\u672A\u6E80\uFF09",
    "xx.error data\uFF08\u500B\u4EBA/\u30C6\u30B9\u30C8\uFF09",
    "xx.\u30BF\u30FC\u30B2\u30C3\u30C8\u5916"
  ].each_with_index do |n, i|
    column_3.table_column_select_items.create!(name: n, position: i + 1)
  end

  p "ProductColumn"

  p "CompanyColumn"
  mf_group.table_columns.create!(table_type: "company", position: 2, index_page_position: 4, name: "\u90FD\u9053\u5E9C\u770C", key_name: "pref", data_type: :string)
  mf_group.table_columns.create!(table_type: "company", position: 3, index_page_position: 5, name: "\u5E02\u533A\u753A\u6751", key_name: "city", data_type: :string)
  mf_group.table_columns.create!(table_type: "company", position: 4, index_page_position: 6, name: "\u756A\u5730", key_name: "address", data_type: :string)
  mf_group.table_columns.create!(table_type: "company", position: 5, index_page_position: 7, name: "\u30D3\u30EB\u540D", key_name: "building", data_type: :string)
  mf_group.table_columns.create!(table_type: "company", position: 6, index_page_position: 8, name: "WEB\u30B5\u30A4\u30C8", key_name: "web_site", data_type: :string)
  mf_group.table_columns.create!(table_type: "company", position: 7, index_page_position: 9, name: "\u96FB\u8A71\u756A\u53F7", key_name: "phone", data_type: :string)

  partner_lead_count = mf_group.table_columns.create!(table_type: "company", position: 8, index_page_position: 10, name: "\u5546\u8AC7\u6570", key_name: "lead_amount", data_type: :stacked, stack_type: "count", target_table: "lead")
  mf_group.table_columns.create!(table_type: "company", position: 9, index_page_position: 11, name: "\u5546\u8AC7\u58F2\u308A\u4E0A\u3052\u7DCF\u984D", key_name: "lead_salse_amount", data_type: :stacked, stack_type: "sum", target_table: "lead", target_column_id: price.id)
  mf_group.table_columns.create!(table_type: "company", position: 10, index_page_position: 12, name: "\u5546\u8AC7\u58F2\u308A\u4E0A\u3052\u6700\u5927\u984D", key_name: "lead_salse_minimum", data_type: :stacked, stack_type: "min", target_table: "lead", target_column_id: price.id)
  mf_group.table_columns.create!(table_type: "company", position: 11, index_page_position: 13, name: "\u5546\u8AC7\u58F2\u308A\u4E0A\u3052\u6700\u5C0F\u984D", key_name: "lead_salse_max", data_type: :stacked, stack_type: "max", target_table: "lead", target_column_id: price.id)

  p "Contract"
  contract_lead_count = mf_group.table_columns.create!(table_type: "contract", position: 8, index_page_position: 10, name: "\u5546\u8AC7\u6570", key_name: "lead_amount", data_type: :stacked, stack_type: "count", target_table: "lead")
  contract_lead_amount = mf_group.table_columns.create!(table_type: "contract", position: 9, index_page_position: 11, name: "\u5546\u8AC7\u58F2\u308A\u4E0A\u3052\u7DCF\u984D", key_name: "lead_salse_amount", data_type: :stacked, stack_type: "sum", target_table: "lead", target_column_id: price.id)
  mf_group.table_columns.create!(table_type: "contract", position: 10, index_page_position: 12, name: "\u5546\u8AC7\u58F2\u308A\u4E0A\u3052\u6700\u5927\u984D", key_name: "lead_salse_minimu", data_type: :stacked, stack_type: "min", target_table: "lead", target_column_id: price.id)
  mf_group.table_columns.create!(table_type: "contract", position: 11, index_page_position: 13, name: "\u5546\u8AC7\u58F2\u308A\u4E0A\u3052\u6700\u5C0F\u984D", key_name: "lead_salse_max", data_type: :stacked, stack_type: "max", target_table: "lead", target_column_id: price.id)

  ##########################
  # 契約
  ##########################
  p "=== Contract ==="
  mf_group.partners.each do |partner|
    mf_group.products.each do |product|
      day = Time.zone.now - rand(90).day
      if partner.contracts.where(product: product).blank?
        mf_group.contracts.create!(company: partner, name: partner.name + "x" + product.name, product: product, hierarchy: partner.hierarchy, datetime_1: day, datetime_2: day + 1.year, price: product.price)
      end
    end
  end

  ##########################
  # 商談
  ##########################
  p "=== Lead ==="

  (1..100).each do |i|
    sample_contract = mf_group.contracts.sample
    mf_group.leads.create!(unique_key:       "M-" + i.to_s,
                           lead_phase_id:    sample_contract.product&.lead_phases&.sample&.id,
                           company_id:       sample_contract.company.id,
                           product_id:       sample_contract.product.id,
                           staff_id:         mf_group.staffs.sample.id,
                           select_item_1_id: column_1.table_column_select_items.sample.id,
                           select_item_2_id: column_2.table_column_select_items.sample.id,
                           select_item_3_id: column_3.table_column_select_items.sample.id,
                           datetime_1:       Time.zone.now - rand(90).day,
                           datetime_2:       Time.zone.now - rand(90).day,
                           datetime_3:       Time.zone.now - rand(90).day,
                           datetime_4:       Time.zone.now - rand(90).day,
                           integer_2:        rand(1_000_000..2_000_000))
  end

  ##########################
  # ダッシュボード
  ##########################
  p "=== Dashboard ==="
  dashboard = mf_group.dashboards.create!(name: "\u30E1\u30A4\u30F3\u30C0\u30C3\u30B7\u30E5\u30DC\u30FC\u30C9")

  ##########################
  # ガジェット
  ##########################
  p "=== Gadgets ==="
  dashboard.gadgets.create!(name: "\u30D1\u30FC\u30C8\u30CA\u30FC\u5225\u5546\u8AC7\u4EF6\u6570", chart_type: "vertical_bar", target_table: "company", target_column_id: partner_lead_count.id)
  dashboard.gadgets.create!(name: "\u30D1\u30FC\u30C8\u30CA\u30FC\u306E\u5546\u54C1\u5225\u58F2\u308A\u4E0A\u3052\u984D", chart_type: "stacked_bar", target_table: "contract", row_group: "company", col_group: "product", target_column_id: contract_lead_amount.id)
  dashboard.gadgets.create!(name: "\u30D1\u30FC\u30C8\u30CA\u30FC\u306E\u5546\u54C1\u5225\u58F2\u308A\u4E0A\u3052\u984D", chart_type: "stacked_bar", target_table: "lead", row_group: "product", col_group: "company", target_column_id: price.id)
end
