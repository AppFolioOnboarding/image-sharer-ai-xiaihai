class Image < ApplicationRecord
  validates :link, presence: true,
            format: { with: URI::regexp,
                      message: "only allows valid URL" }
end
