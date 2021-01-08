class Notice < ApplicationRecord
    validates :title, presence: true,      #标题不得为空
                    length: { minimum: 5 } # 标题最短5个字符
end