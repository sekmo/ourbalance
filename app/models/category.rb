class Category < ApplicationRecord
  # TODO custom validation: user can be nil only if default=true
  belongs_to :user, optional: true
end
