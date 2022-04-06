require 'rails_helper'

RSpec.describe Memo, type: :model do
  before do
    @memo = FactoryBot.build(:memo)
  end

  describe '読書メモ登録' do
    context '読書メモが登録できる場合' do
      it '全ての項目の入力が存在すれば登録できること' do
        expect(@memo).to be_valid
      end
      it 'アクションプランが空でも登録できること' do
        expect(@memo).to be_valid
      end
      it '読書メモが空でも登録できること' do
        expect(@memo).to be_valid
      end
    end
    context '読書メモが登録できない場合' do
      it '本のタイトルが空では登録できない' do
        @memo.title = ''
        @memo.valid?
        expect(@memo.errors.full_messages).to include("Title can't be blank")
      end
      it '読む目的が空では登録できない' do
        @memo.goal = ''
        @memo.valid?
        expect(@memo.errors.full_messages).to include("Goal can't be blank")
      end
      it 'ユーザーが紐付いていなければ登録できない' do
        @memo.user = nil
        @memo.valid?
        expect(@memo.errors.full_messages).to include('User must exist')
      end
    end
  end
end
