module Web
  module Public
    class RankingController < ApplicationController

      def players
        @players = query_players.players
      end

      def budokai_solo
        @winners = query_budokai_solo.winners
      end

      def budokai_party
        @winners = query_budokai_party.winners
      end

      def guilds
        @guilds = query_guilds.guilds
      end

      private

      def query_players
        @query_players ||= Query::Public::Players.new(players_params)
      end

      def query_budokai_solo
        @query_budokai_solo ||= Query::Public::BudokaiSolo.new(budokai_solo_params)
      end

      def query_budokai_party
        @query_budokai_party ||= Query::Public::BudokaiParty.new(budokai_party_params)
      end

      def query_guilds
        @query_guilds ||= Query::Public::Guilds.new(guilds_params)
      end

      def players_params
        prms = params.permit(:page, :per)

        prms.merge!(
          name: params[:search][:name],
          game_class: params[:search][:game_class],
          guild: params[:search][:guild]
        ) if params[:search].present?
        prms
      end

      def budokai_solo_params
        prms = params.permit(:page, :per)

        prms.merge!(
          player: params[:search][:player],
          game_class: params[:search][:game_class],
          guild: params[:search][:guild],
          type: params[:search][:type]
        ) if params[:search].present?
        prms
      end

      def budokai_party_params
        prms = params.permit(:page, :per)

        prms.merge!(
          player: params[:search][:player],
          game_class: params[:search][:game_class],
          type: params[:search][:type]
        ) if params[:search].present?
        prms
      end

      def guilds_params
        prms = params.permit(:page, :per)

        prms.merge!(
          name: params[:search][:name]
        ) if params[:search].present?
        prms
      end
    end
  end
end
