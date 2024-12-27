class Note < ApplicationRecord
  belongs_to :parent, class_name: "Note", optional: true
  has_many :children, class_name: "Note", foreign_key: "parent_id"

  broadcasts_refreshes
end
