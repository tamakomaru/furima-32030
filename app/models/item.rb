class Item < ApplicationRecord
belongs_to :user
has_one :purchase_info
belongs_to_active_hash :category
belongs_to_active_hash :condition
belongs_to_active_hash :shipping_charge
belongs_to_active_hash :prefectures
belongs_to_active_hash :purchase_to_day

validates :item_name, :text, presence: true
validates :explanation, :text, presence: true

validates :category_id, numericality: { other_than: 1 }
validates :condition_id, numericality: { other_than: 1 }
validates :shipping_charge_id, numericality: { other_than: 1 }
validates :prefectures_id, numericality: { other_than: 1 }
validates :purchase_to_day_id, numericality: { other_than: 1 }
end
