module Web
  module Admins
    class DashboardController < BaseController
      def index
        set_general_table
        set_management_table
        set_budokais_table
      end

      private

      def set_general_table
        @player_count = GameInfo.instance.player_count
        @accounts_count = Account.count
        @characters_count = Character.count
        @guilds_count = Guild.count
        @items_count = Item.count
      end

      def set_management_table
        @admins_count = Account.isGm_admin.count
        @gms_count = Account.isGm_game_master.count
        @tls_count = Account.isGm_team_leader.count
        @cms_count = Account.isGm_community_manager.count
        @players_count = Account.isGm_player.count
      end

      def set_budokais_table
        @budokais_count = BudokaiWinner.count
        @budokai_solo_adult_count = BudokaiWinner.solo_match.adult.count
        @budokai_party_adult_count = BudokaiWinner.party_match.adult.count
        @budokai_solo_kid_count = BudokaiWinner.solo_match.kid.count
        @budokai_party_kid_count = BudokaiWinner.party_match.kid.count
      end
    end
  end
end
