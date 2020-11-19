class Item < ApplicationRecord

  belongs_to :user
  has_one :purchase_info

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_charge
  belongs_to :prefectures
  belongs_to :purchase_to_day

  with_options presence: true do
  validates :item_name
  validates :explanation
  validates :category_id, numericality: { other_than: 1 }
  validates :condition_id, numericality: { other_than: 1 }
  validates :shipping_charge_id, numericality: { other_than: 1 }
  validates :prefectures_id, numericality: { other_than: 1 }
  validates :purchase_to_day_id, numericality: { other_than: 1 }
  end

end
