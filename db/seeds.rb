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
# デフォルトラベル
##########################
p '=== DefaultLabel ==='
DefaultLabel.create(order: 1, name: '申請中')
DefaultLabel.create(order: 2, name: '差し戻し')
DefaultLabel.create(order: 3, name: '対応中')
DefaultLabel.create(order: 4, name: '完了')

##########################
# 会社
##########################
p '=== Company ==='
maker_1 = Company.find_or_create_by!(name: 'サンプルメーカー', postcode: '150-0001', prefecture_id: '13', address: '都内某所',)

partner_1 = Company.find_or_create_by!(name: '海山商事', postcode: '150-0001', prefecture_id: '13', address: '都内某所',)
partner_2 = Company.find_or_create_by!(name: '山川商事', postcode: '150-0001', prefecture_id: '13', address: '都内某所',)
partner_3 = Company.find_or_create_by!(name: '双葉商事', postcode: '330-0856', prefecture_id: '11', address: '大宮某所',)

partner_1_1 = Company.find_or_create_by!(name: '鎌倉物産', postcode: '150-0001', prefecture_id: '13', address: '都内某所',)
partner_1_2 = Company.find_or_create_by!(name: '大磯物産',postcode: '150-0001', prefecture_id: '13', address: '都内某所',)
partner_1_3 = Company.find_or_create_by!(name: '七里ヶ浜物産', postcode: '150-0001', prefecture_id: '13', address: '都内某所',)
partner_1_4 = Company.find_or_create_by!(name: '由比ヶ浜物産', postcode: '150-0001', prefecture_id: '13', address: '都内某所',)

partner_2_1 = Company.find_or_create_by!(name: '筑波物産', postcode: '150-0001', prefecture_id: '13', address: '都内某所',)
partner_2_2 = Company.find_or_create_by!(name: '秩父物産', postcode: '150-0001', prefecture_id: '13', address: '都内某所',)
partner_2_3 = Company.find_or_create_by!(name: '高尾物産', postcode: '150-0001', prefecture_id: '13', address: '都内某所',)
partner_2_4 = Company.find_or_create_by!(name: '富士物産', postcode: '150-0001', prefecture_id: '13', address: '都内某所',)

partner_1_1_1 = Company.find_or_create_by!(name: '鶴岡商店', postcode: '150-0001', prefecture_id: '13', address: '都内某所',)
partner_1_1_2 = Company.find_or_create_by!(name: '八幡商店', postcode: '150-0001', prefecture_id: '13', address: '都内某所',)
partner_1_1_3 = Company.find_or_create_by!(name: '小町商店', postcode: '150-0001', prefecture_id: '13', address: '都内某所',)

##########################
# ユーザー
##########################
def dumy_force_create(company, email, name)
  user = company.users.new(email: email, password: 'password')
  user.skip_confirmation!
  user.save!
  user.create_user_profile(name: name)
  return user
end

p '=== User ==='
maker_user_1 = dumy_force_create(maker_1, 'sample@maker1.com', 'メーカー太郎')

partner_1_user_1 = dumy_force_create(partner_1, 'sample@partner1.com', 'フグ田 マスオ')
partner_2_user_1 = dumy_force_create(partner_2, 'sample@partner2.com', '磯野波平')
partner_3_user_1 = dumy_force_create(partner_3, 'sample@partner3.com', '野原ひろし')

partner_1_1_user_1 = dumy_force_create(partner_1_1, 'sample@partner1-1.com', '鎌倉二次郎')
partner_1_2_user_1 = dumy_force_create(partner_1_2, 'sample@partner1-2.com', '大磯二次郎')
partner_1_3_user_1 = dumy_force_create(partner_1_3, 'sample@partner1-3.com', '七里ヶ浜二次郎')
partner_1_4_user_1 = dumy_force_create(partner_1_4, 'sample@partner1-4.com', '由比ヶ浜二次郎')

partner_2_1_user_1 = dumy_force_create(partner_2_1, 'sample@partner2-1.com', '筑波二次郎')
partner_2_2_user_1 = dumy_force_create(partner_2_2, 'sample@partner2-2.com', '秩父二次郎')
partner_2_3_user_1 = dumy_force_create(partner_2_3, 'sample@partner2-3.com', '高尾二次郎')
partner_2_4_user_1 = dumy_force_create(partner_2_4, 'sample@partner2-4.com', '富士二次郎')

partner_1_1_1_user_1 = dumy_force_create(partner_1_1_1, 'sample@partner1-1-1.com', '鶴岡三次郎')
partner_1_1_2_user_1 = dumy_force_create(partner_1_1_2, 'sample@partner1-1-2.com', '八幡三次郎')
partner_1_1_3_user_1 = dumy_force_create(partner_1_1_3, 'sample@partner1-1-3.com', '小町三次郎')

##########################
# メーカーグループ
##########################
p '=== MakerGroup ==='
maker_group_1 = MakerGroup.create!(maker: maker_1)

##########################
# パートナー
##########################
p '=== Partner ==='
maker_group_1.partners.create!(company: partner_1, hierarchy: 1, parent: maker_1)
maker_group_1.partners.create!(company: partner_2, hierarchy: 1, parent: maker_1)
maker_group_1.partners.create!(company: partner_3, hierarchy: 1, parent: maker_1)

maker_group_1.partners.create!(company: partner_1_1, hierarchy: 2, parent: partner_1)
maker_group_1.partners.create!(company: partner_1_2, hierarchy: 2, parent: partner_1)
maker_group_1.partners.create!(company: partner_1_3, hierarchy: 2, parent: partner_1)
maker_group_1.partners.create!(company: partner_1_4, hierarchy: 2, parent: partner_1)

maker_group_1.partners.create!(company: partner_2_1, hierarchy: 2, parent: partner_2)
maker_group_1.partners.create!(company: partner_2_2, hierarchy: 2, parent: partner_2)
maker_group_1.partners.create!(company: partner_2_3, hierarchy: 2, parent: partner_2)
maker_group_1.partners.create!(company: partner_2_4, hierarchy: 2, parent: partner_2)

maker_group_1.partners.create!(company: partner_1_1_1, hierarchy: 3, parent: partner_1_1)
maker_group_1.partners.create!(company: partner_1_1_2, hierarchy: 3, parent: partner_1_1)
maker_group_1.partners.create!(company: partner_1_1_3, hierarchy: 3, parent: partner_1_1)

##########################
# 商品
##########################
p '=== Product ==='
product_1 = maker_group_1.products.create!(name: '会計システム1年契約', price: 200000, incentive: 10000)
product_2 = maker_group_1.products.create!(name: '家計簿システム1年契約', price: 50000, incentive: 5000)
product_3 = maker_group_1.products.create!(name: '高速光回線', price: 50000, incentive: 5000)

##########################
# 商品ラベル
##########################
p '=== ProductLabel ==='
product_1.product_labels.create!(order: 1, name: '申請中')
product_1.product_labels.create!(order: 2, name: '導入先確認中')
product_1.product_labels.create!(order: 3, name: '日程調整中')
product_1.product_labels.create!(order: 4, name: '差し戻し')
product_1.product_labels.create!(order: 5, name: '対応中')
product_1.product_labels.create!(order: 6, name: '完了')

product_2.product_labels.create!(order: 1, name: '申請中')
product_2.product_labels.create!(order: 2, name: '差し戻し')
product_2.product_labels.create!(order: 3, name: '完了')

product_3.product_labels.create!(order: 1, name: '未対応')
product_3.product_labels.create!(order: 2, name: '折衝中')
product_3.product_labels.create!(order: 3, name: '設備待ち')
product_3.product_labels.create!(order: 4, name: '工事待ち')
product_3.product_labels.create!(order: 5, name: '注文取り消し')
product_3.product_labels.create!(order: 6, name: '完了')

##########################
# 商品メタ
##########################
p '=== ProductMeta ==='
product_2.product_metas.create!(order: 1, meta_key: 'number_of_family', meta_label: '顧客の世帯人数')

product_3.product_metas.create!(order: 1, meta_key: 'ntt_flag', meta_label: 'NTT東西フラグ')
product_3.product_metas.create!(order: 2, meta_key: 'ntt_area', meta_label: '申し込み地域')
product_3.product_metas.create!(order: 3, meta_key: 'pref', meta_label: '申し込み県')
product_3.product_metas.create!(order: 4, meta_key: 'entry_at', meta_label: 'フレッツエントリー日')
product_3.product_metas.create!(order: 5, meta_key: 'plan_name', meta_label: 'プラン名')
product_3.product_metas.create!(order: 6, meta_key: 'construction_at', meta_label: '工事日')
##########################
# ベンダーグループ
##########################
p '=== VendorGroup ==='
vendor_group_0 = maker_group_1.vendor_groups.create!(vendor: maker_1, layer: 0)

vendor_group_1 = maker_group_1.vendor_groups.create!(vendor: partner_1, layer: 1)
vendor_group_2 = maker_group_1.vendor_groups.create!(vendor: partner_2, layer: 1)
vendor_group_3 = maker_group_1.vendor_groups.create!(vendor: partner_3, layer: 1)

vendor_group_1_1 = maker_group_1.vendor_groups.create!(vendor: partner_1_1, layer: 2)

##########################
# エージェント
##########################
p '=== Agent ==='
vendor_group_0.agents.create!(maker_group: maker_group_1, company: partner_1, hierarchy: 1)
vendor_group_0.agents.create!(maker_group: maker_group_1, company: partner_2, hierarchy: 1)
vendor_group_0.agents.create!(maker_group: maker_group_1, company: partner_3, hierarchy: 1)

vendor_group_0.agents.create!(maker_group: maker_group_1, company: partner_1_1, hierarchy: 2, parent: partner_1)
vendor_group_0.agents.create!(maker_group: maker_group_1, company: partner_1_2, hierarchy: 2, parent: partner_1)
vendor_group_0.agents.create!(maker_group: maker_group_1, company: partner_1_3, hierarchy: 2, parent: partner_1)
vendor_group_0.agents.create!(maker_group: maker_group_1, company: partner_1_4, hierarchy: 2, parent: partner_1)

vendor_group_0.agents.create!(maker_group: maker_group_1, company: partner_2_1, hierarchy: 2, parent: partner_2)
vendor_group_0.agents.create!(maker_group: maker_group_1, company: partner_2_2, hierarchy: 2, parent: partner_2)
vendor_group_0.agents.create!(maker_group: maker_group_1, company: partner_2_3, hierarchy: 2, parent: partner_2)
vendor_group_0.agents.create!(maker_group: maker_group_1, company: partner_2_4, hierarchy: 2, parent: partner_2)

vendor_group_0.agents.create!(maker_group: maker_group_1, company: partner_1_1_1, hierarchy: 3, parent: partner_1_1)
vendor_group_0.agents.create!(maker_group: maker_group_1, company: partner_1_1_2, hierarchy: 3, parent: partner_1_1)
vendor_group_0.agents.create!(maker_group: maker_group_1, company: partner_1_1_3, hierarchy: 3, parent: partner_1_1)

vendor_group_1.agents.create!(maker_group: maker_group_1, company: partner_1_1, hierarchy: 2)
vendor_group_1.agents.create!(maker_group: maker_group_1, company: partner_1_2, hierarchy: 2)
vendor_group_1.agents.create!(maker_group: maker_group_1, company: partner_1_3, hierarchy: 2)
vendor_group_1.agents.create!(maker_group: maker_group_1, company: partner_1_4, hierarchy: 2)

vendor_group_2.agents.create!(maker_group: maker_group_1, company: partner_2_1, hierarchy: 2)
vendor_group_2.agents.create!(maker_group: maker_group_1, company: partner_2_2, hierarchy: 2)
vendor_group_2.agents.create!(maker_group: maker_group_1, company: partner_2_3, hierarchy: 2)
vendor_group_2.agents.create!(maker_group: maker_group_1, company: partner_2_4, hierarchy: 2)

vendor_group_1_1.agents.create!(maker_group: maker_group_1, company: partner_1_1_1, hierarchy: 3)
vendor_group_1_1.agents.create!(maker_group: maker_group_1, company: partner_1_1_2, hierarchy: 3)
vendor_group_1_1.agents.create!(maker_group: maker_group_1, company: partner_1_1_3, hierarchy: 3)

##########################
# ベンダーの商品
##########################
p '=== VendorProduct ==='
maker_group_1.vendor_groups.each do |vendor_group|
  maker_group_1.products.each do |product|
    maker_group_1.vendor_products.create!(vendor_group: vendor_group, product: product, price: product.price * 0.9, incentive: product.incentive * 0.9)
  end
end

##########################
# エージェントの商品
##########################
p '=== AgentProduct ==='
maker_group_1.vendor_groups.each do |vendor_group|
  vendor_group.agents.where(parent: nil).each do |agent|
  maker_group_1.products.each do |product|
      maker_group_1.agent_products.create!(vendor_group: vendor_group, agent: agent, product: product, price: product.price * 0.8, incentive: product.incentive * 0.8)
    end
  end
end

##########################
# 申し込み
##########################
p '=== Offer ==='
offer_index = 1
maker_group_1.vendor_groups.each do |vendor_group|
  vendor_group.agents.where(parent: nil).each do |agent|
  maker_group_1.products.each do |product|
      offer = maker_group_1.offers.create(progress: rand(1..4), unique_key: 'W-' + format("%06d",offer_index ), vendor_group: vendor_group, agent: agent, product: product, user: agent.company.users.first)
      product.product_metas.each do |meta|
        offer.offer_metas.create!(meta_key: meta.meta_key, meta_label: meta.meta_label, meta_value: 'テスト', order: meta.order)
      end
      offer_index += 1
    end
  end
end

##########################
# 申し込みメタ
##########################
# p '=== OfferMeta ==='
# product_3.offers.each do |offer|
#   offer.offer_metas.create()
# end

##########################
# ベンダー周知事項
##########################
p '=== VendorInformation ==='
vendor_group_0.vendor_informations.create!(title: '申請方法変更のお知らせ', content: '申請方法が変更になります', user: maker_user_1, maker_group: maker_group_1)
vendor_group_0.vendor_informations.create!(title: '手数料変更のお知らせ', content: '手数料が変更になります', user: maker_user_1, maker_group: maker_group_1)
vendor_group_0.vendor_informations.create!(title: '担当者のお知らせ', content: '担当者が変更になります', user: maker_user_1, maker_group: maker_group_1)


vendor_group_1.vendor_informations.create!(title: '申請方法変更のお知らせ', content: '申請方法が変更になります', user: partner_1_user_1, maker_group: maker_group_1)
vendor_group_1.vendor_informations.create!(title: '手数料変更のお知らせ', content: '手数料が変更になります', user: partner_1_user_1, maker_group: maker_group_1)
vendor_group_1.vendor_informations.create!(title: '担当者のお知らせ', content: '担当者が変更になります', user: partner_1_user_1, maker_group: maker_group_1)


end #ApplicationRecord.transaction do

