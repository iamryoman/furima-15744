class Order < ApplicationRecord
  belongs_to :purchase_history
  attr_accessor :token

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture
end
