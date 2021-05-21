# == Schema Information
#
# Table name: lead_raw_labels
#
#  id             :bigint           not null, primary key
#  col_aa         :string(255)
#  col_ab         :string(255)
#  col_ac         :string(255)
#  col_ad         :string(255)
#  col_ae         :string(255)
#  col_af         :string(255)
#  col_ag         :string(255)
#  col_ah         :string(255)
#  col_ai         :string(255)
#  col_aj         :string(255)
#  col_ak         :string(255)
#  col_al         :string(255)
#  col_am         :string(255)
#  col_an         :string(255)
#  col_ao         :string(255)
#  col_ap         :string(255)
#  col_aq         :string(255)
#  col_ar         :string(255)
#  col_as         :string(255)
#  col_at         :string(255)
#  col_au         :string(255)
#  col_av         :string(255)
#  col_aw         :string(255)
#  col_ax         :string(255)
#  col_ay         :string(255)
#  col_az         :string(255)
#  col_ba         :string(255)
#  col_bb         :string(255)
#  col_bc         :string(255)
#  col_bd         :string(255)
#  col_be         :string(255)
#  col_bf         :string(255)
#  col_bg         :string(255)
#  col_bh         :string(255)
#  col_bi         :string(255)
#  col_bj         :string(255)
#  col_bk         :string(255)
#  col_bl         :string(255)
#  col_bm         :string(255)
#  col_bn         :string(255)
#  col_bo         :string(255)
#  col_bp         :string(255)
#  col_bq         :string(255)
#  col_br         :string(255)
#  col_bs         :string(255)
#  col_bt         :string(255)
#  col_bu         :string(255)
#  col_bv         :string(255)
#  col_bw         :string(255)
#  col_bx         :string(255)
#  col_by         :string(255)
#  col_bz         :string(255)
#  col_ca         :string(255)
#  col_cb         :string(255)
#  col_cc         :string(255)
#  contract_type  :integer          default(10), not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  maker_group_id :bigint           not null
#  product_id     :bigint           not null
#
# Indexes
#
#  index_lead_raw_labels_on_maker_group_id  (maker_group_id)
#  index_lead_raw_labels_on_product_id      (product_id)
#
# Foreign Keys
#
#  fk_rails_...  (maker_group_id => maker_groups.id)
#  fk_rails_...  (product_id => products.id)
#
require 'rails_helper'

RSpec.describe LeadRawLabel, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
