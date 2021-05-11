require 'rails_helper'

RSpec.describe Tune, type: :model do
  before do
    @tune = FactoryBot.build(:tune)
  end

  describe '曲投稿' do
    context '曲投稿ができるとき' do
     it "全ての項目の入力が存在すれば投稿できること" do
      expect(@tune).to be_valid
  end
end
end

context '曲投稿が出来ないとき' do
  it "曲名が存在しないとき投稿できない" do
    @tune.name =""
    @tune.valid?
    expect(@tune.errors.full_messages).to include("Name can't be blank")
  end

  it "URLが存在しないとき投稿できない" do
    @tune.url =""
    @tune.valid?
    expect(@tune.errors.full_messages).to include("Url can't be blank")
  end

  it "イメージ画像が存在しないとき投稿できない" do
    @tune.image = nil
    @tune.valid?
    expect(@tune.errors.full_messages).to include("Image can't be blank")
  end

  it "ジャンルの情報がない場合投稿できない" do
    @tune.genre_id = ""
    @tune.valid?
    expect(@tune.errors.full_messages).to include("Genre can't be blank", "Genre is not a number")
  end

  it "ジャンルのidが１の場合投稿できない" do
    @tune.genre_id = 1
    @tune.valid?
    expect(@tune.errors.full_messages).to include("Genre must be other than 1")
  end

  it "アーティストが存在しないとき投稿できない" do
    @tune.artist =""
    @tune.valid?
    expect(@tune.errors.full_messages).to include("Artist can't be blank")
  end

  it "textが存在しないとき投稿できない" do
    @tune.text =""
    @tune.valid?
    expect(@tune.errors.full_messages).to include("Text can't be blank")
  end

  it 'ユーザーが紐付いていなければ投稿できない' do
    @tune.user = nil
    @tune.valid?
    expect(@tune.errors.full_messages).to include('User must exist')
  end

end
end
