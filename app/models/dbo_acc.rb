class DboAcc < ActiveRecord::Base
  self.abstract_class = true

  connects_to database: { writing: :accounts, reading: :accounts }
end
