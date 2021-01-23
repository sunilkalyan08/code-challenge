class Company < ApplicationRecord
  include CompanyActions
  has_rich_text :description
  validates :email, format: {with: /\b[A-Z0-9._%a-z\-]+@getmainstreet\.com\z/, message: 'The email should be with @getmainstreet domain.'}, uniqueness: true
  DEFAULT_COLOR = '#bb00ff'
end