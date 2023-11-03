module Query
  module Admins
    class Accounts
      include Virtus.model

      attribute :page, Integer, default: 1
      attribute :per, Integer, default: 20

      # Filters
      attribute :id, Integer
      attribute :username, String
      attribute :email, String
      attribute :status, String
      attribute :gm_level, Integer

      def accounts
        @accounts ||= resultset
      end

      private

      def resultset
        filte_by_id
        filter_by_username
        filter_by_email
        filter_by_status
        filter_by_gm_level
        sort
      end

      def filte_by_id
        return if id.blank?

        @rs = rs.where(AccountID: id)
      end

      def filter_by_username
        return if username.blank?

        @rs = rs.where('Username LIKE ?', "%#{username}%")
      end

      def filter_by_email
        return if email.blank?

        @rs = rs.where('email LIKE ?', "%#{email}%")
      end

      def filter_by_status
        return if status.blank?

        @rs = rs.where('acc_status LIKE ?', "%#{status}%")
      end

      def filter_by_gm_level
        return if gm_level.blank?

        @rs = rs.where(isGm: gm_level)
      end
      
      def sort
        rs.order('AccountID ASC')
          .paginate(page: page, per_page: per)
      end

      def rs
        @rs ||= ::Account.where.not(AccountID: 0)
      end
    end
  end
end
