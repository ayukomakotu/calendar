class Target < ApplicationRecord
  belongs_to :user, optional: true #optional: true nilや存在しない値を許可する
  belongs_to :office, optional: true #optional: true nilや存在しない値を許可する
end
