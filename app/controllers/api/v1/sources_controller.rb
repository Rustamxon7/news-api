module Api
  module V1
    class SourcesController < ApplicationController
      before_action :set_source, only: %i[ show update destroy ]
    
      # GET /sources
      def index
        @sources = Source.all.random.latest
        render json: @sources
      end

      # # GET /:url
      def website

        unless params[:url] == 'all_sources'
          @sources = Source.website(params[:url])
          else
            @sources = Source.all.random.latest
          end
        render json: @sources
      end

      # Create /sources/scrape
      def scrape
        Source.scrape_all
        
        if Source.scrape_all
          render json: { 
            message: 'Scraped successfully',
            body: Source.all.latest.limit(5),
            time: Time.now
          }, status: :ok
        else
          render json: { message: 'Scraping failed' }, status: :unprocessable_entity
        end
      end
    
      # GET /sources/1
      def show
        render json: @source
      end
    
      # POST /sources
      def create
        @source = Source.new(source_params)
    
        if @source.save
          render json: @source, status: :created, location: @source
        else
          render json: @source.errors, status: :unprocessable_entity
        end
      end
    
      # PATCH/PUT /sources/1
      def update
        if @source.update(source_params)
          render json: @source
        else
          render json: @source.errors, status: :unprocessable_entity
        end
      end
    
      # DELETE /sources/1
      def destroy
        @source.destroy
      end
    
      private
        # Use callbacks to share common setup or constraints between actions.
        def set_source
          @source = Source.find(params[:id])
        end
    
        # Only allow a list of trusted parameters through.
        def source_params
          params.require(:source).permit(:title, :url, :source, :description, :image_url, :category, :published_at)
        end
    end    
  end
end