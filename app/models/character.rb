class Character < DboChar
  self.primary_key = :CharID
  belongs_to :account, foreign_key: :AccountID

  scope :not_gm, -> { where(GameMaster: 0) }

  enum Race: {
    human: 0,
    namek: 1,
    majin: 2
  }

  enum Class: {
    martial_artist: 0,
    spiritualist: 1,
    engineer: 2,
    warrior: 3,
    dragon_clan: 4,
    mighty_majin: 5,
    wonder_majin: 6,
    fighter: 7,
    swordsman: 8,
    crane_hermit: 9,
    turtle_hermit: 10,
    gun_maniac: 11,
    mech_manic: 12,
    dark_warrior: 13,
    shadow_knight: 14,
    dende_priest: 15,
    poko_priest: 16,
    ultimate_majin: 17,
    grand_chef_majin: 18,
    plasma_majin: 19,
    karma_majin: 20
  }
  
  enum Gender: {
    male: 0,
    female: 1
  }

  def play_time
    sec = self.PlayTime
    "%02dh %02dm" % [sec / 3600, sec / 60 % 60]
  end

  def rank
    Character.not_gm.where("PlayTime >= ?", self.PlayTime).count
  end
end