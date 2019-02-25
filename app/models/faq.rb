class Faq < ApplicationRecord
  default_scope { order(created_at: :asc) }
end
