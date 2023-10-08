class BudokaiWinner < DboLog
  belongs_to :winner_1, class_name: 'Character', foreign_key: :WinnerCharID1, primary_key: :CharID
  belongs_to :winner_2, class_name: 'Character', foreign_key: :WinnerCharID2, primary_key: :CharID
  belongs_to :winner_3, class_name: 'Character', foreign_key: :WinnerCharID3, primary_key: :CharID
  belongs_to :winner_4, class_name: 'Character', foreign_key: :WinnerCharID4, primary_key: :CharID
  belongs_to :winner_5, class_name: 'Character', foreign_key: :WinnerCharID5, primary_key: :CharID

  scope :solo_match, -> { where(MatchType: 0) }
  scope :party_match, -> { where(MatchType: 1) }

  def tournment_label
    adult? ? 'Adult' : 'Kid'
  end

  def adult?
    self.Type
  end

  def party_match?
    self.MatchType
  end

  def date
    self.Date.strftime('%Y/%m/%d')
  end
end
