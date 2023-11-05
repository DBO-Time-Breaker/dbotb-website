class GameInfo < DboLog
  self.table_name = 'game_info'

  scope :instance , -> { first }
end
