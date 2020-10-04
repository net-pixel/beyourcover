class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  has_one :address, dependent: :destroy
  has_many :addresses , dependent: :destroy
  has_many :cards, dependent: :destroy
  has_many :carts, dependent: :destroy
  has_many :cart_details, dependent: :destroy
  # accepts_nested_attributes_for :address //後から使用予定
  # has_many :buyed_products, foreign_key: "buyer_id", class_name: "Product"
  # has_many :saling_products, -> { where("buyer_id is NULL") }, foreign_key: "user_id", class_name: "Product"
  # has_many :sold_products, -> { where("buyer_id is not NULL") }, foreign_key: "user_id", class_name: "Product"
  # has_many :products, dependent: :destroy
  # has_many :sns_credentials

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  VALID_NAME_REGEX = /\A[ぁ-んァ-ン一-龥]/
  VALID_KANA_REGEX = /\A[ァ-ンー－]+\z/

  validates :name, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: true }, format: { with: VALID_EMAIL_REGEX }
  validates :password, presence: true
  validates :password_confirmation, presence: true
  validates :last_name, presence: true, format: { with: VALID_NAME_REGEX, message: "は全角文字で入力して下さい。" }
  validates :first_name, presence: true, format: { with: VALID_NAME_REGEX, message: "は全角文字で入力して下さい。" }
  validates :last_kana, presence: true, format: { with: VALID_KANA_REGEX, message: "は全角平仮名で入力して下さい。" }
  validates :first_kana, presence: true, format: { with: VALID_KANA_REGEX, message: "は全角平仮名で入力して下さい。" }

  def is_confirmation_period_expired?
    # メールアドレス確認メール有効期限チェック(期限はconfig/initializers/devise.rbのconfirm_withinで設定)
    self.confirmation_period_expired?
  end
end
