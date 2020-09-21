class Address < ApplicationRecord
  belongs_to :user, optional: true, dependent: :destroy

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture

  VALID_CODE_REGEX = /\A[0-9]{3}-[0-9]{4}\z/

  validates :post_code, presence: true, format: { with: VALID_CODE_REGEX, message: "は3桁の半角数字、ハイフン（-）、4桁の半角数字の順で記入してください。" }
  validates :prefecture_id, presence: true
  validates :city, presence: true
  validates :address, presence: true
  validates :phone_number    , numericality: { only_integer: true }, length: { in: 10..11 }, uniqueness: { case_sensitive: true }
end
