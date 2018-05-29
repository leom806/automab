module Api
  module V1
    class MainController < ApplicationController

      skip_before_action :authenticate
      
      def api_v1_doc
        
        doc = {
          versao: "v1.0",
          runtime: `ruby -v`,
          rails_version: `rails -v`,
          environment: Rails.env
        }

        render json: {"Documentação API": doc }, status: :ok
      end
    end
  end
end