class DowndloadLink < ActiveRecord::Base
  scope :active, -> { where(active: true) }

  validates :provider, presence: true
  validates :link, presence: true
  validates :active, inclusion: { in: [true, false] }
  validates :link, uniqueness: { scope: :provider }

  enum provider: {
    google_drive: 0,
    mediafire: 1,
    mega: 2
  }
end
