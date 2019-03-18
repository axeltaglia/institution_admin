class Item < ApplicationRecord
  belongs_to :subscription
  belongs_to :fee
end
