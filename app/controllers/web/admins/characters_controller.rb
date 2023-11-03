module Web
  module Admins
    class CharactersController < BaseController
      def index
        @characters = query_characters.characters
      end

      private

      def query_characters
        @query_characters ||= Query::Admins::Characters.new(characters_params)
      end

      def characters_params
        prms = params.permit(:page, :per)

        prms.merge!(
          id: params[:search][:id],
          name: params[:search][:name],
          game_class: params[:search][:game_class],
          guild: params[:search][:guild]
        ) if params[:search].present?
        prms
      end
    end
  end
end
