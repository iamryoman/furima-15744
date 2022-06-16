class Order < ApplicationRecord
  belongs_to :purchase_history
  attr_accessor :token


  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture

  # 空の投稿を保存できないようにする
  validates :token, presence: true
end
