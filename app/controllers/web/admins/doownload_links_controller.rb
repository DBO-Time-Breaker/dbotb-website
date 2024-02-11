module Web
  module Admins
    class DownloadLinksController < BaseController
      before_action :set_download_link, only: [:edit, :update, :destroy]

      def index
        @download_links = DownloadLink.all.order('created_at ASC')
                                      .paginate(page: pa[:page], per_page: 10)
      end

      def new
        @download_link = DownloadLink.new
      end

      def create
        @download_link = DownloadLink.new(download_link_params)
        if @download_link.save
          redirect_to admin_download_links_path, notice: "Download link created successfully"
        else
          render :new
        end
      end

      def edit
      end

      def update
        if @download_link.update(download_link_params)
          redirect_to admin_download_links_path, notice: "Download link updated successfully"
        else
          render :edit
        end
      end

      def destroy
        @download_link.destroy
        redirect_to admin_download_links_path, notice: "Download link deleted successfully"
      end

      private

      def set_download_link
        @download_link = DownloadLink.find(params[:id])
      end

      def download_link_params
        params.require(:download_link).permit(:provider, :link, :active)
      end
    end
  end
end