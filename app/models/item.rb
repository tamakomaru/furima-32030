class Item < ApplicationRecord
  has_one_attached :image
  has_one :purchase
  belongs_to :user

  with_options presence: true do
    validates :item_name, length: { maximum: 40 }
    validates :explanation
    validates :category_id
    validates :condition_id
    validates :shipping_charge_id
    validates :prefecture_id
    validates :purchase_to_day_id
    validates :value, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }, format: { with: /\A[0-9]+\z/, message: 'には半角の数字を使用してください' }
    validates :image
  end

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_charge
  belongs_to :prefecture
  belongs_to :purchase_to_day

  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :condition_id
    validates :shipping_charge_id
    validates :prefecture_id
    validates :purchase_to_day_id
  end
end
