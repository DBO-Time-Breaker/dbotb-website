module Query
  module Admins
    class Characters
      include Virtus.model

      attribute :page, Integer, default: 1
      attribute :per, Integer, default: 20

      # Filters
      attribute :id, Integer
      attribute :name, String
      attribute :game_class, Integer
      attribute :guild, String
      attribute :gm_level, Integer
      attribute :account, String

      def characters
        @characters ||= resultset
      end

      private

      def resultset
        filte_by_id
        filter_by_name
        filter_by_game_class
        filter_by_guild
        filter_by_gm_level
        filter_by_account
        sort
      end

      def filte_by_id
        return if id.blank?

        @rs = rs.where(CharID: id)
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

      def filter_by_gm_level
        return if gm_level.blank?

        @rs = rs.where(GameMaster: gm_level)
      end

      def filter_by_account
        return if account.blank?

        account_id = Account.where('Username LIKE ?', "%#{account}%").pluck(:AccountID)
        @rs = rs.where(AccountID: account_id)
      end
      
      def sort
        rs.order('CharID ASC')
          .paginate(page: page, per_page: per)
      end

      def rs
        @rs ||= ::Character.where.not(CharID: 0)
      end
    end
  end
end
