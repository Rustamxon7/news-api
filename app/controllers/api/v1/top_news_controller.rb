module Api
  module V1
    class TopNewsController < ApplicationController
      def index
        @top_news = Source.random.top_five.latest
        render json: @top_news
      end
    end
  end
end