module Api
  module V1
    class MainController < ApplicationController

      skip_before_action :authenticate
      
      def api_v1_doc
        
        doc = {
          version: "v1.0",
          runtime: `ruby -v`,
          rails_version: `rails -v`,
          environment: Rails.env,
          last_commit_hash: `git show-ref`.split.first,
          current_user: (current_user.blank? ? "visitante" : current_user.nome),
          axioma_da_existencia: "Rails > .NET"
        }

        render json: {"Documentação da API": doc }, status: :ok
      end
    end
  end
end