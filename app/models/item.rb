class Item < ApplicationRecord

  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to_active_hash :category 
  belongs_to_active_hash :charge
  belongs_to_active_hash :condition
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :days_ship
  belongs_to :user
  has_one_attached :image

  #ジャンルの選択が「---」の時は保存できないようにする
  validates :category_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :charge_id,    numericality: { other_than: 1 , message: "can't be blank"}
  validates :condition_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :days_ship_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :prefecture_id, numericality: { other_than: 1 , message: "can't be blank"}


  validates :name, presence: true
  # <!-- name           =  アイテム名           -->

  validates :explanation, presence: true
  # <!-- explanation    =  アイテムテキスト      -->

  validates :category, presence: true
  # <!-- category       =  アイテムカテゴリー    -->

  validates :condition, presence: true
  # <!-- condition      =  アイテムの状態       -->

  with_options presence: true, format: { with: /\A[0-9]+\z/ } do
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 },
                      presence: { message: "Can't be blank"}
  end
  # <!-- price          =  販売価格            -->
  
  validates :charge_id, presence: true
  # <!-- charges        =  配送料の負担         -->
  
  validates :prefecture, presence: true
  #  <!-- prefecture     =  発送元の地域         -->
  
  validates :days_ship, presence: true
  # <!-- days_ship      =  発送までの日数        -->


  validates :image, presence: true
  # <!-- image          =  画像                 -->

end


