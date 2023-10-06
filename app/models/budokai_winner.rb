class BudokaiWinner < DboLog
  belongs_to :winner_1, class_name: 'Character', foreign_key: :WinnerCharID1, primary_key: :CharID
  belongs_to :winner_2, class_name: 'Character', foreign_key: :WinnerCharID2, primary_key: :CharID
  belongs_to :winner_3, class_name: 'Character', foreign_key: :WinnerCharID3, primary_key: :CharID
  belongs_to :winner_4, class_name: 'Character', foreign_key: :WinnerCharID4, primary_key: :CharID
  belongs_to :winner_5, class_name: 'Character', foreign_key: :WinnerCharID5, primary_key: :CharID

  def adult?
    Type
  end

  def party_match?
    MatchType
  end
end
