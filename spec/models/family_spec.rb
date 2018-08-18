require 'rails_helper'

RSpec.describe Family, type: :model do

  describe '家族メンバーが存在するかを返す' do
    context '家族メンバーが0人のとき' do
      it 'falseを返すこと' do
        family = FactoryBot.create(:family)
        expect(family.member?).to be_falsey
      end
    end

    context '家族メンバーが1人以上のとき' do
      it 'trueを返すこと' do
        family = FactoryBot.create(:family, :with_members)
        expect(family.member?).to be_truthy
      end
    end
  end

  describe '家族を削除する' do
    it '家族メンバーも同時に削除すること' do
      family = FactoryBot.create(:family, :with_members)
      original_count = family.members.count
      expect do
        family.destroy!
      end.to change(User, :count).by(-original_count)
    end
  end
end
