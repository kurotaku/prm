# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

ApplicationRecord.transaction do
  ##########################
  # 都道府県マスタ
  ##########################
  p '=== Prefucture ==='
  Prefecture.find_or_create_by(id: 1, code: '01', name: '北海道')
  Prefecture.find_or_create_by(id: 2, code: '02', name: '青森県')
  Prefecture.find_or_create_by(id: 3, code: '03', name: '岩手県')
  Prefecture.find_or_create_by(id: 4, code: '04', name: '宮城県')
  Prefecture.find_or_create_by(id: 5, code: '05', name: '秋田県')
  Prefecture.find_or_create_by(id: 6, code: '06', name: '山形県')
  Prefecture.find_or_create_by(id: 7, code: '07', name: '福島県')
  Prefecture.find_or_create_by(id: 8, code: '08', name: '茨城県')
  Prefecture.find_or_create_by(id: 9, code: '09', name: '栃木県')
  Prefecture.find_or_create_by(id: 10, code: '10', name: '群馬県')
  Prefecture.find_or_create_by(id: 11, code: '11', name: '埼玉県')
  Prefecture.find_or_create_by(id: 12, code: '12', name: '千葉県')
  Prefecture.find_or_create_by(id: 13, code: '13', name: '東京都')
  Prefecture.find_or_create_by(id: 14, code: '14', name: '神奈川県')
  Prefecture.find_or_create_by(id: 15, code: '15', name: '新潟県')
  Prefecture.find_or_create_by(id: 16, code: '16', name: '富山県')
  Prefecture.find_or_create_by(id: 17, code: '17', name: '石川県')
  Prefecture.find_or_create_by(id: 18, code: '18', name: '福井県')
  Prefecture.find_or_create_by(id: 19, code: '19', name: '山梨県')
  Prefecture.find_or_create_by(id: 20, code: '20', name: '長野県')
  Prefecture.find_or_create_by(id: 21, code: '21', name: '岐阜県')
  Prefecture.find_or_create_by(id: 22, code: '22', name: '静岡県')
  Prefecture.find_or_create_by(id: 23, code: '23', name: '愛知県')
  Prefecture.find_or_create_by(id: 24, code: '24', name: '三重県')
  Prefecture.find_or_create_by(id: 25, code: '25', name: '滋賀県')
  Prefecture.find_or_create_by(id: 26, code: '26', name: '京都府')
  Prefecture.find_or_create_by(id: 27, code: '27', name: '大阪府')
  Prefecture.find_or_create_by(id: 28, code: '28', name: '兵庫県')
  Prefecture.find_or_create_by(id: 29, code: '29', name: '奈良県')
  Prefecture.find_or_create_by(id: 30, code: '30', name: '和歌山県')
  Prefecture.find_or_create_by(id: 31, code: '31', name: '鳥取県')
  Prefecture.find_or_create_by(id: 32, code: '32', name: '島根県')
  Prefecture.find_or_create_by(id: 33, code: '33', name: '岡山県')
  Prefecture.find_or_create_by(id: 34, code: '34', name: '広島県')
  Prefecture.find_or_create_by(id: 35, code: '35', name: '山口県')
  Prefecture.find_or_create_by(id: 36, code: '36', name: '徳島県')
  Prefecture.find_or_create_by(id: 37, code: '37', name: '香川県')
  Prefecture.find_or_create_by(id: 38, code: '38', name: '愛媛県')
  Prefecture.find_or_create_by(id: 39, code: '39', name: '高知県')
  Prefecture.find_or_create_by(id: 40, code: '40', name: '福岡県')
  Prefecture.find_or_create_by(id: 41, code: '41', name: '佐賀県')
  Prefecture.find_or_create_by(id: 42, code: '42', name: '長崎県')
  Prefecture.find_or_create_by(id: 43, code: '43', name: '熊本県')
  Prefecture.find_or_create_by(id: 44, code: '44', name: '大分県')
  Prefecture.find_or_create_by(id: 45, code: '45', name: '宮崎県')
  Prefecture.find_or_create_by(id: 46, code: '46', name: '鹿児島県')
  Prefecture.find_or_create_by(id: 47, code: '47', name: '沖縄県')

  ##########################
  # ユーザーアクション
  ##########################
  p '=== UserAction ==='
  UserAction.find_or_create_by!(name: '自社プロフィール閲覧', ctrl_path: 'company_page/company', act_path:'show')
  UserAction.find_or_create_by!(name: '自社プロフィール編集', ctrl_path: 'company_page/company', act_path:'update')
  UserAction.find_or_create_by!(name: '社員名簿一覧', ctrl_path: 'company_page/user_profiles', act_path:'index')
  UserAction.find_or_create_by!(name: '社員名簿作成', ctrl_path: 'company_page/user_profiles', act_path:'create')
  UserAction.find_or_create_by!(name: '社員アカウント一覧', ctrl_path: 'company_page/users', act_path:'index')
  UserAction.find_or_create_by!(name: '社員アカウント発行', ctrl_path: 'company_page/users', act_path:'create')
  UserAction.find_or_create_by!(name: '社員権限管理', ctrl_path: 'company_page/users/roles', act_path:'index')
  UserAction.find_or_create_by!(name: '社員権限変更', ctrl_path: 'company_page/users/roles', act_path:'update')
  UserAction.find_or_create_by!(name: '操作制限設定閲覧', ctrl_path: 'company_page/user_permissions', act_path:'index')
  UserAction.find_or_create_by!(name: '操作制限設定追加', ctrl_path: 'company_page/user_permissions', act_path:'create')


  ##########################
  # 会社
  ##########################
  p '=== Company ==='
  admin_company = Company.find_or_create_by!(name: 'Admin用企業')

  maker_company_1 = Company.find_or_create_by!(name: 'サンプルメーカー', postcode: '150-0001', prefecture_id: '13', address: '都内某所', contract_type: 20)

  partner_company_1 = Company.find_or_create_by!(name: '海山商事', postcode: '150-0001', prefecture_id: '13', address: '都内某所')
  partner_company_2 = Company.find_or_create_by!(name: '山川商事', postcode: '150-0001', prefecture_id: '13', address: '都内某所')
  partner_company_3 = Company.find_or_create_by!(name: '双葉商事', postcode: '330-0856', prefecture_id: '11', address: '大宮某所')

  partner_company_1_1 = Company.find_or_create_by!(name: '鎌倉物産', postcode: '150-0001', prefecture_id: '13', address: '都内某所')
  partner_company_1_2 = Company.find_or_create_by!(name: '大磯物産', postcode: '150-0001', prefecture_id: '13', address: '都内某所')
  partner_company_1_3 = Company.find_or_create_by!(name: '七里ヶ浜物産', postcode: '150-0001', prefecture_id: '13', address: '都内某所')
  partner_company_1_4 = Company.find_or_create_by!(name: '由比ヶ浜物産', postcode: '150-0001', prefecture_id: '13', address: '都内某所')

  partner_company_2_1 = Company.find_or_create_by!(name: '筑波物産', postcode: '150-0001', prefecture_id: '13', address: '都内某所')
  partner_company_2_2 = Company.find_or_create_by!(name: '秩父物産', postcode: '150-0001', prefecture_id: '13', address: '都内某所')
  partner_company_2_3 = Company.find_or_create_by!(name: '高尾物産', postcode: '150-0001', prefecture_id: '13', address: '都内某所')
  partner_company_2_4 = Company.find_or_create_by!(name: '富士物産', postcode: '150-0001', prefecture_id: '13', address: '都内某所')

  partner_company_1_1_1 = Company.find_or_create_by!(name: '鶴岡商店', postcode: '150-0001', prefecture_id: '13', address: '都内某所')
  partner_company_1_1_2 = Company.find_or_create_by!(name: '八幡商店', postcode: '150-0001', prefecture_id: '13', address: '都内某所')
  partner_company_1_1_3 = Company.find_or_create_by!(name: '小町商店', postcode: '150-0001', prefecture_id: '13', address: '都内某所')

  ##########################
  # ユーザー
  ##########################
  def dumy_force_create(company, email, name)
    user = company.users.new(name: name, email: email, password: 'password', role: 20)
    user.skip_confirmation!
    user.save!
    user
  end

  p '=== User ==='
  admin_user = admin_company.users.create(name: '運営Admin', email: 'admin@admin.com', password: 'password', role: 50, account_type: 30)
  admin_user.skip_confirmation!
  admin_user.save!

  last_name = %w[佐藤 鈴木 木村 渡辺 加藤 斎藤 近藤 高橋 田中 伊藤 山本 中村 小林 山田 佐々木 井上 林]
  first_name = %w[太郎 一郎 花子 よし子 優子 健 太一 二郎 真司 剛 翔太 はるか 綾香 美咲 さくら]

  maker_company_user_1 = dumy_force_create( maker_company_1, 'sample@maker1.com', 'メーカー太郎')

  partner_company_1_user_1 = dumy_force_create(partner_company_1, 'sample@partner_company1.com', 'フグ田 マスオ')
  partner_company_1_user_2 = dumy_force_create(partner_company_1, 'sample1@partner_company1.com', '穴子 太郎')
  partner_company_2_user_1 = dumy_force_create(partner_company_2, 'sample@partner_company2.com', '磯野波平')
  partner_company_2_user_2 = dumy_force_create(partner_company_2, 'sample1@partner_company2.com', '岡島 太郎')
  partner_company_3_user_1 = dumy_force_create(partner_company_3, 'sample@partner_company3.com', '野原ひろし')
  partner_company_3_user_2 = dumy_force_create(partner_company_3, 'sample1@partner_company3.com', '川口 太郎')

  partner_company_1_1_user_1 = dumy_force_create(partner_company_1_1, 'sample@partner_company1-1.com', '鎌倉二次郎')
  partner_company_1_2_user_1 = dumy_force_create(partner_company_1_2, 'sample@partner_company1-2.com', '大磯二次郎')
  partner_company_1_3_user_1 = dumy_force_create(partner_company_1_3, 'sample@partner_company1-3.com', '七里ヶ浜二次郎')
  partner_company_1_4_user_1 = dumy_force_create(partner_company_1_4, 'sample@partner_company1-4.com', '由比ヶ浜二次郎')

  partner_company_2_1_user_1 = dumy_force_create(partner_company_2_1, 'sample@partner_company2-1.com', '筑波二次郎')
  partner_company_2_2_user_1 = dumy_force_create(partner_company_2_2, 'sample@partner_company2-2.com', '秩父二次郎')
  partner_company_2_3_user_1 = dumy_force_create(partner_company_2_3, 'sample@partner_company2-3.com', '高尾二次郎')
  partner_company_2_4_user_1 = dumy_force_create(partner_company_2_4, 'sample@partner_company2-4.com', '富士二次郎')

  partner_company_1_1_1_user_1 = dumy_force_create(partner_company_1_1_1, 'sample@partner_company1-1-1.com', '鶴岡三次郎')
  partner_company_1_1_2_user_1 = dumy_force_create(partner_company_1_1_2, 'sample@partner_company1-1-2.com', '八幡三次郎')
  partner_company_1_1_3_user_1 = dumy_force_create(partner_company_1_1_3, 'sample@partner_company1-1-3.com', '小町三次郎')

  # (1..5).each do |i|
  #   user = Company.where.not(name: 'Admin用企業').sample.users.new(email: "dummy+" + i.to_s + "@test.com", password: "password", name: last_name.sample + " " + first_name.sample)
  #   user.skip_confirmation!
  #   user.save!
  # end

  # (1..5).each do |i|
  #   Company.all.sample.user_profiles.create(name: last_name.sample + " " + first_name.sample)
  # end
  
  ##########################
  # メーカーグループ
  ##########################
  p '=== MakerGroup ==='
  maker_group_1 = MakerGroup.create!(maker: maker_company_1)

  ##########################
  # パートナー
  ##########################
  p '=== Partner ==='
  partner_1 = maker_group_1.partners.create!(company: partner_company_1, name: partner_company_1.name, hierarchy: 1)
  partner_2 = maker_group_1.partners.create!(company: partner_company_2, name: partner_company_2.name, hierarchy: 1)
  partner_3 = maker_group_1.partners.create!(company: partner_company_3, name: partner_company_3.name, hierarchy: 1)

  partner_1_1 = maker_group_1.partners.create!(company: partner_company_1_1, name: partner_company_1_1.name, hierarchy: 2, parent: partner_1)
  partner_1_2 = maker_group_1.partners.create!(company: partner_company_1_2, name: partner_company_1_2.name, hierarchy: 2, parent: partner_1)
  partner_1_3 = maker_group_1.partners.create!(company: partner_company_1_3, name: partner_company_1_3.name, hierarchy: 2, parent: partner_1)
  partner_1_4 = maker_group_1.partners.create!(company: partner_company_1_4, name: partner_company_1_4.name, hierarchy: 2, parent: partner_1)

  partner_2_1 = maker_group_1.partners.create!(company: partner_company_2_1, name: partner_company_2_1.name, hierarchy: 2, parent: partner_2)
  partner_2_2 = maker_group_1.partners.create!(company: partner_company_2_2, name: partner_company_2_2.name, hierarchy: 2, parent: partner_2)
  partner_2_3 = maker_group_1.partners.create!(company: partner_company_2_3, name: partner_company_2_3.name, hierarchy: 2, parent: partner_2)
  partner_2_4 = maker_group_1.partners.create!(company: partner_company_2_4, name: partner_company_2_4.name, hierarchy: 2, parent: partner_2)

  partner_1_1_1 = maker_group_1.partners.create!(company: partner_company_1_1_1, name: partner_company_1_1_1.name, hierarchy: 3, parent: partner_1_1)
  partner_1_1_2 = maker_group_1.partners.create!(company: partner_company_1_1_2, name: partner_company_1_1_2.name, hierarchy: 3, parent: partner_1_1)
  partner_1_1_3 = maker_group_1.partners.create!(company: partner_company_1_1_3, name: partner_company_1_1_3.name, hierarchy: 3, parent: partner_1_1)

   ##########################
  # メーカーグループ上のユーザー情報
  ##########################
  p '=== MakerGroupUserInfo ==='
  maker_group_1.partners.each do |partner|
    partner.company.users.each do|user|
      maker_group_1.maker_group_user_infos.create!(partner: partner, user: user, name: user.name, company: user.company)
    end
  end

  ##########################
  # 商品
  ##########################
  p '=== Product ==='
  product_1 = maker_group_1.products.create!(name: '会計システム1年契約', code: 'p-0001', agency_price: 200_000, agency_incentive: 10_000, introduction_price: 200_000, introduction_incentive: 10_000, wholesale_price: 200_000, wholesale_incentive: 10_000)
  product_2 = maker_group_1.products.create!(name: '家計簿システム1年契約', code: 'p-0002', agency_price: 200_000, agency_incentive: 10_000, introduction_price: 200_000, introduction_incentive: 10_000, wholesale_price: 200_000, wholesale_incentive: 10_000)
  product_3 = maker_group_1.products.create!(name: '高速光回線', code: 'p-0003', agency_price: 200_000, agency_incentive: 10_000, introduction_price: 200_000, introduction_incentive: 10_000, wholesale_price: 200_000, wholesale_incentive: 10_000)

  ##########################
  # ベンダーグループ
  ##########################
  p '=== VendorGroup ==='
  vendor_group_1 = maker_group_1.vendor_groups.create!(vendor: partner_1, layer: 1, product_id: product_3.id, price: product_3.agency_price * 0.9, incentive: product_3.agency_incentive * 0.9, contracted_at: Time.zone.now)
  vendor_group_2 = maker_group_1.vendor_groups.create!(vendor: partner_2, layer: 1, product_id: product_3.id, price: product_3.agency_price * 0.8, incentive: product_3.agency_incentive * 0.8, contracted_at: Time.zone.now)
  vendor_group_3 = maker_group_1.vendor_groups.create!(vendor: partner_3, layer: 1, product_id: product_3.id, price: product_3.agency_price * 0.7, incentive: product_3.agency_incentive * 0.7, contracted_at: Time.zone.now)

  # vendor_group_1_1 = maker_group_1.vendor_groups.create!(vendor: partner_1_1, layer: 2)

  ##########################
  # 案件の項目
  ##########################
  p '=== LeadColumn ==='

  maker_group_1.lead_columns.create!(name: 'ユニークキー', order: 0, data_type: :unique_key, index_page_order: 0)
  maker_group_1.lead_columns.create!(name: 'パートナー名', order: 1, data_type: :partner, index_page_order: 1)
  maker_group_1.lead_columns.create!(name: '販売担当者名', order: 2, data_type: :user_info_partner, index_page_order: 2)
  maker_group_1.lead_columns.create!(name: 'サポート担当者名', order: 3, data_type: :user_info_partner, index_page_order: 3)

  select_column_1 = maker_group_1.lead_columns.create!(name: 'フレッツ完了ステータス', order: 4, data_type: :select_item)
  %w[未対応 折衝中 設備待ち 工事待ち 注文取り消し 完了].each_with_index do |n, i|
    select_column_1.lead_column_select_items.create!(name: n, order: i + 1, )
  end
  select_column_2 = maker_group_1.lead_columns.create!(name: 'NTT東西フラグ', order: 5, data_type: :select_item, index_page_order: 4)
  %w[西 東].each_with_index do |n, i|
    select_column_2.lead_column_select_items.create!(name: n, order: i + 1)
  end
  select_column_3 = maker_group_1.lead_columns.create!(name: '後確コール大区分', order: 7, data_type: :select_item, index_page_order: 5)
  %w[後確OK（CSV） 後確OK（代コン） 後確OK（CSVノーコール）].each_with_index do |n, i|
    select_column_3.lead_column_select_items.create!(name: n, order: i + 1)
  end

  select_column_4 = maker_group_1.lead_columns.create!(name: '対応コール大区分', order: 6, data_type: :select_item)
  %w[工事日確定 対応完了].each_with_index do |n, i|
    select_column_4.lead_column_select_items.create!(name: n, order: i + 1)
  end

  select_column_5 = maker_group_1.lead_columns.create!(name: '他社回線種別', order: 8, data_type: :select_item)
  %w[新規発番 ソフトバンクテレコム イオ NTT].each_with_index do |n, i|
    select_column_5.lead_column_select_items.create!(name: n, order: i + 1)
  end

  maker_group_1.lead_columns.create!(name: '獲得リスト', order: 9, data_type: :string, index_page_order: 6)
  maker_group_1.lead_columns.create!(name: '単価', order: 10, data_type: :price, index_page_order: 7)
  maker_group_1.lead_columns.create!(name: '個数', order: 11, data_type: :integer, index_page_order: 8)
  maker_group_1.lead_columns.create!(name: '契約日', order: 12, data_type: :datetime, index_page_order: 9)

  ##########################
  # 案件
  ##########################
  p '=== Lead ==='
  string_1_array = %w[コンサルティングサポート パーフェクション ベルテクノス Umake]
  20.times do
    Lead.create!( unique_key: 'T-' + rand(1000000..2000000).to_s,
                  maker_group_id: maker_group_1.id, partner_id: maker_group_1.partners.sample.id, product_id: product_3.id,
                  user_info_partner_1_id: maker_group_1.maker_group_user_infos.sample.id,
                  user_info_partner_2_id: maker_group_1.maker_group_user_infos.sample.id,
                  select_item_1_id: select_column_1.lead_column_select_items.sample.id,
                  select_item_2_id: select_column_2.lead_column_select_items.sample.id,
                  select_item_3_id: select_column_3.lead_column_select_items.sample.id,
                  select_item_4_id: select_column_4.lead_column_select_items.sample.id,
                  select_item_5_id: select_column_5.lead_column_select_items.sample.id,
                  string_1: string_1_array.sample,
                  price_1: rand(1000000..2000000),
                  integer_1: rand(1..10),
                  datetime_1: Time.zone.now - rand(90).day,
                )
  end
  
  ##########################
  # 商品のチャット
  ##########################
  p '=== Message ==='
  board_1 = Board.create!(related_object: 'product', related_object_uid: product_3.uid)
  board_1.messages.create!(user: maker_company_user_1, content: 'この商品の販促用資料をアップロードしています。まだの方はご確認ください。')
  board_1.messages.create!(user: maker_company_user_1, content: 'この商品は年末リニューアル予定です。スケジュールは追ってご報告します。')
  board_1.messages.create!(user: partner_company_2_user_1, content: '了解しました。')
end
