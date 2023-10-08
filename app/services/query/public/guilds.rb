module Query
  module Public
    class Guilds
      include Virtus.model

      attribute :page, Integer, default: 1
      attribute :per, Integer, default: 20

      # Filters
      attribute :name, String

      def guilds
        @guilds ||= resultset
      end

      private

      def resultset
        filter_by_name
        sort
      end

      def filter_by_name
        return if name.blank?

        @rs = rs.where('GuildName LIKE ?', "%#{name}%")
      end
      
      def sort
        rs.order('GuildPointEver DESC')
          .paginate(page: page, per_page: per)
      end

      def rs
        @rs ||= ::Guild
      end
    end
  end
end
