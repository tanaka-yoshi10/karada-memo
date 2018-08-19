require 'rails_helper'

RSpec.describe Family, type: :model do

  describe '家族メンバーが存在するかを返す' do
    context '家族メンバーが0人のとき' do
      it '存在しないと判定すること' do
        family = FactoryBot.create(:family)
        expect(family).not_to be_member
      end
    end

    context '家族メンバーが1人以上のとき' do
      it '存在すると判定すること' do
        family = FactoryBot.create(:family, :with_members)
        expect(family).to be_member
      end
    end
  end

  describe 'からだ情報が存在するかを返す' do
    context 'からだ情報が0個のとき' do
      it '存在しないと判定すること' do
        family = FactoryBot.create(:family)
        expect(family).not_to be_body
      end
    end

    context 'からだ情報が1個以上のとき' do
      it '存在すると判定すること' do
        family = FactoryBot.create(:family, :with_bodies)
        expect(family).to be_body
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

    it 'からだ情報も同時に削除すること' do
      family = FactoryBot.create(:family, :with_bodies)
      original_count = family.bodies.count
      expect do
        family.destroy!
      end.to change(Body, :count).by(-original_count)
    end
  end
end
