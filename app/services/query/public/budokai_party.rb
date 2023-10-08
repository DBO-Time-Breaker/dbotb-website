module Query
  module Public
    class BudokaiParty
      include Virtus.model

      attribute :page, Integer, default: 1
      attribute :per, Integer, default: 20

      # Filters
      attribute :type, Integer
      attribute :player, String
      attribute :game_class, Integer

      def winners
        @winners ||= resultset
      end

      private

      def resultset
        filter_by_type
        filter_by_player
        filter_by_game_class
        sort
      end

      def filter_by_type
        return if type.blank?
        
        @rs = rs.where(Type: type)
      end

      def filter_by_player
        return if player.blank?

        player_ids = ::Character.where('CharName LIKE ?', "%#{player}%").ids
        @rs = rs.where("
          WinnerCharID1 IN (:player_ids) OR
          WinnerCharID2 IN (:player_ids) OR
          WinnerCharID3 IN (:player_ids) OR
          WinnerCharID4 IN (:player_ids) OR
          WinnerCharID5 IN (:player_ids)",
          player_ids: player_ids)
      end

      def filter_by_game_class
        return if game_class.blank?
        
        player_ids = ::Character.where(Class: game_class).ids
        @rs = rs.where("
          WinnerCharID1 IN (:player_ids) OR
          WinnerCharID2 IN (:player_ids) OR
          WinnerCharID3 IN (:player_ids) OR
          WinnerCharID4 IN (:player_ids) OR
          WinnerCharID5 IN (:player_ids)",
          player_ids: player_ids)
      end
      
      def sort
        rs.order('Date DESC')
          .paginate(page: page, per_page: per)
      end

      def rs
        @rs ||= ::BudokaiWinner.party_match
      end
    end
  end
end
