require 'rails_helper'

RSpec.describe Note, type: :model do
  describe 'ノートを検証する' do
    it '有効なファクトリを持つこと' do
      expect(FactoryBot.build(:note)).to be_valid
    end

    it '最大長の詳細は有効であること' do
      note = FactoryBot.build(:note, detail: 'a' * 140)
      expect(note).to be_valid
    end

    it '最大長+1文字の詳細は無効であること' do
      note = FactoryBot.build(:note, detail: 'a' * (140 + 1))
      note.valid?
      expect(note.errors[:detail]).to include('は140文字以内で入力してください')
    end
  end

  describe 'ノートを作成する' do
    context '記録日時が未指定のとき' do
      it 'モデルの作成日時を記録日時に設定すること' do
        note = FactoryBot.create(:note)
        expect(note.noted_at).to eq note.created_at
      end
    end

    context '記録日時が指定されているとき' do
      it '指定された日時を記録日時に設定すること' do
        yesterday = 1.day.ago
        note = FactoryBot.create(:note, noted_at: yesterday)
        expect(note.noted_at).to eq yesterday
      end
    end
  end
end
