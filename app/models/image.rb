class Image < ApplicationRecord
  validates :link, presence: true,
                   format: { with: URI::DEFAULT_PARSER.make_regexp,
                             message: 'only allows valid URL' }
  acts_as_taggable
end
