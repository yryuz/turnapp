class Genre < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '1960年代' },
    { id: 3, name: '1970年代' },
    { id: 4, name: '1980年代' },
    { id: 5, name: '1990年代' },
    { id: 6, name: '2000年代' },
    { id: 7, name: '2010年代' },
    { id: 8, name: 'J-POP' },
    { id: 9, name: 'R&B' },
    { id: 10, name: 'アコーステック' },
    { id: 11, name: '歌謡曲' },
    { id: 12, name: 'キッズ/ファミリー' },
    { id: 13, name: 'クラシック' },
    { id: 14, name: 'ジャズ' },
    { id: 15, name: 'ロック' },
    { id: 16, name: 'HIPHOP' },
    { id: 17, name: 'REGGAE' },
    { id: 18, name: '洋楽' },
    { id: 19, name: 'EDM' },
    { id: 20, name: 'その他' }
  ]
  include ActiveHash::Associations
  has_many :tunes
  end