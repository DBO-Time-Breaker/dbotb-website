class Guild < DboChar
  self.primary_key = :GuildID

  belongs_to :guild_master, class_name: 'Character', foreign_key: :GuildMaster, primary_key: :CharID
  has_many :members, class_name: 'Character', foreign_key: :GuildID
  has_one :dojo, foreign_key: :GuildID

  def dojo?
    dojo.present?
  end

  def rank
    Guild.where("GuildPointEver >= ?", self.GuildPointEver).count
  end
end
