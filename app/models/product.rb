class Product < ApplicationRecord
  belongs_to :user, foreign_key: "user_id"
  belongs_to :category
  has_many :images, dependent: :destroy
  has_many :cart_details

  accepts_nested_attributes_for :images, allow_destroy: true
  validates :images, presence: { message: "は1枚以上10枚以下のアップロードが必要です" }

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture

  validates :name, presence: { message: "は必須です" }
  validates :detail, presence: { message: "は必須です" }
  validates :category_id, presence: { message: "を選択してください" }
  validates :postage, presence: { message: "を選択してください" }
  validates :price, presence: { message: "を入力してください" }
  validates :stock, presence: { message: "を入力してください" }
end
