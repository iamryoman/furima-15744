class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

        # 全角カタカナ
        VALID_KANA_REGEX = /\A[ァ-ヶー－]+\z/.freeze
        # 全角ひらがな、全角カタカナ、漢字
        VALID_ZENKAKU_REGEX = /\A[ぁ-んァ-ン一-龥]/.freeze
        # 英数混合
        VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze

        validates :password, presence: true, format: { with: VALID_PASSWORD_REGEX, message: "は半角英数を両方含む必要があります"}
        validates :nickname, presence: true
        validates :first_name, presence: true, format: { with: VALID_ZENKAKU_REGEX, message: "は全角ひらがな、全角カタカナ、漢字で入力を行う必要があります" }
        validates :last_name, presence: true, format: { with: VALID_ZENKAKU_REGEX, message: "は全角ひらがな、全角カタカナ、漢字で入力を行う必要があります" }
        validates :first_name_kana, presence: true, format: { with: VALID_KANA_REGEX, message: "は全角カタカナで入力を行う必要があります" }
        validates :last_name_kana, presence: true, format: { with: VALID_KANA_REGEX, message: "は全角カタカナで入力を行う必要があります" }
        validates :birthday, presence: true

        has_many :items, dependent: :destroy
        has_many :orders, dependent: :destroy


end
