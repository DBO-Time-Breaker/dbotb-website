module Query
  module Public
    class Players
      include Virtus.model

      attribute :page, Integer, default: 1
      attribute :per, Integer, default: 20

      # Filters
      attribute :name, String
      attribute :game_class, Integer
      attribute :guild, String

      def players
        @players ||= resultset
      end

      private

      def resultset
        filter_by_name
        filter_by_game_class
        filter_by_guild
        sort
      end

      def filter_by_name
        return if name.blank?

        @rs = rs.where('CharName LIKE ?', "%#{name}%")
      end

      def filter_by_game_class
        return if game_class.blank?
        
        player_ids = ::Character.ids
        @rs = rs.where(Class: game_class)
      end

      def filter_by_guild
        return if guild.blank?

        @rs = rs.where('GuildName LIKE ?', "%#{guild}%")
      end

      
      def sort
        rs.order('PlayTime DESC')
          .paginate(page: page, per_page: per)
      end

      def rs
        @rs ||= ::Character.not_gm
      end
    end
  end
end
