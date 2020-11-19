class Item < ApplicationRecord
belongs_to :user
has_one :purchase_info
belongs_to_active_hash :category
belongs_to_active_hash :condition
belongs_to_active_hash :shipping_charge
belongs_to_active_hash :prefectures
belongs_to_active_hash :purchase_to_day

end
