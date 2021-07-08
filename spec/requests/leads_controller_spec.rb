# frozen_string_literal: true

require 'rails_helper'

RSpec.describe LeadsController, type: :request do
  let!(:organization) { create(:organization) }
  let!(:user) { create(:user, organization: organization) }
  let!(:vendor_group) { create(:vendor_group, vendor_organization: organization) }
  let!(:company) { create(:company, organization: organization, vendor_group: vendor_group) }
  let!(:staff) { create(:staff, user: user, company: company, vendor_group: vendor_group) }
  let!(:lead) { create(:lead, vendor_group: vendor_group) }

  shared_examples 'アクセス制限' do
    it 'ログインしていない場合は /users/sign_in にリダイレクトされる' do
      is_expected.to eq 302
      expect(response).to redirect_to user_session_path
    end
  end

  shared_examples 'アクセス許可' do
    it 'ログインしている場合は リクエストは200:OK になる' do
      sign_in user
      is_expected.to eq 200
    end
  end

  describe '#index' do
    subject { get leads_path(vendor_group.uid) }

    it_behaves_like 'アクセス許可'
    it_behaves_like 'アクセス制限'
  end

  describe '#new' do
    subject { get new_lead_path(vendor_group.uid) }

    it_behaves_like 'アクセス許可'
    it_behaves_like 'アクセス制限'
  end

  describe '#create' do
    let(:lead_params) do
      {
        name:            '案件名',
        vendor_group_id: vendor_group.id,
      }
    end

    subject { post leads_path(vendor_group.uid), params: { lead: lead_params } }

    it_behaves_like 'アクセス制限'

    context 'ログインしている場合' do
      before { sign_in user }

      it 'Leadが保存される' do
        expect { subject }.to change { Lead.count }.by 1
      end

      context 'バリデーションエラーのとき' do
        let(:lead_params) { { name: 'a' * 256 } }
        it ':new がrenderされる' do
          is_expected.to render_template :new
        end
      end
    end
  end

  describe '#show' do
    subject { get lead_path(vendor_group.uid, lead.uid) }

    it_behaves_like 'アクセス許可'
    it_behaves_like 'アクセス制限'
  end

  describe '#edit' do
    subject { get lead_path(vendor_group.uid, lead.uid) }

    it_behaves_like 'アクセス許可'
    it_behaves_like 'アクセス制限'
  end

  describe '#update' do
    let(:lead_params) do
      {
        name: '案件名',
      }
    end

    subject { patch lead_path(vendor_group.uid, lead.uid), params: { lead: lead_params } }

    it_behaves_like 'アクセス制限'

    context 'ログインしている場合' do
      before { sign_in user }

      context '失敗したとき' do
        let(:lead_params) { { name: 'a' * 256 } }

        it ':edit がrenderされること' do
          is_expected.to render_template :edit
        end

        it 'エラーメッセージが表示されること' do
          subject
          expect(flash[:danger]).to include('商談を更新できませんでした')
        end
      end
    end
  end

  describe '#destroy' do
    subject { delete lead_path(vendor_group.uid, lead.uid) }

    it_behaves_like 'アクセス制限'

    context 'ログインしている場合' do
      before do
        sign_in user
      end

      context '削除に成功したとき' do
        it '削除されること' do
          expect { subject }.to change { Lead.count }.by(-1)
        end

        it 'リダイレクトされること' do
          is_expected.to eq 302
          expect(response).to redirect_to leads_path
        end
      end

      context '削除に失敗したとき' do
        before do
          allow_any_instance_of(Lead).to receive(:destroy).and_return(false)
        end

        it 'showが表示されること' do
          is_expected.to eq 200
          expect(response).to render_template(:show)
        end
      end
    end
  end
end
