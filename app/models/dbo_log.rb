class DboLog < ActiveRecord::Base
  self.abstract_class = true

  connects_to database: { writing: :logs, reading: :logs }
end
