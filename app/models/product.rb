class Product < ApplicationRecord
  belongs_to :user, foreign_key: "user_id"
  belongs_to :category
  has_many :images, dependent: :destroy
  belongs_to :buyer, class_name: "User"

  accepts_nested_attributes_for :images, allow_destroy: true
  validates :images, presence: { message: "は1枚以上10枚以下のアップロードが必要です" }

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture

  validates :name, presence: { message: "は必須です" }
  validates :detail, presence: { message: "は必須です" }
  validates :price, presence: { message: "を入力してください" }
  validates :category_id, presence: { message: "を選択してください" }
  validates :postage, presence: { message: "を選択してください" }
  validates :prefecture_id, presence: { message: "を選択してください" }
  validates :shipping_day, presence: { message: "を選択してください" }
end
