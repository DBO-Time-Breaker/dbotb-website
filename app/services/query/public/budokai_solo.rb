module Query
  module Public
    class BudokaiSolo
      include Virtus.model

      attribute :page, Integer, default: 1
      attribute :per, Integer, default: 20

      # Filters
      attribute :type, Integer
      attribute :player, String
      attribute :game_class, Integer
      attribute :guild, String

      def winners
        @winners ||= resultset
      end

      private

      def resultset
        filter_by_type
        filter_by_player
        filter_by_game_class
        filter_by_guild
        sort
      end

      def filter_by_type
        return if type.blank?
        
        @rs = rs.where(Type: type)
      end

      def filter_by_player
        return if player.blank?

        player_ids = ::Character.where('CharName LIKE ?', "%#{player}%").ids
        @rs = rs.where(winner_1: player_ids)
      end

      def filter_by_game_class
        return if game_class.blank?
        
        player_ids = ::Character.where(Class: game_class).ids
        @rs = rs.where(winner_1: player_ids)
      end

      def filter_by_guild
        return if guild.blank?

        player_ids = ::Character.where('GuildName LIKE ?', "%#{guild}%").ids
        @rs = rs.where(winner_1: player_ids)
      end

      
      def sort
        rs.order('Date DESC')
          .paginate(page: page, per_page: per)
      end

      def rs
        @rs ||= ::BudokaiWinner.solo_match
      end
    end
  end
end
