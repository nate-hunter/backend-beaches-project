module Api
  module V1
    class BeachesController < ApplicationController
      before_action :get_beach, only: [:show, :edit, :update, :destroy]

      def index
        @beaches = Beach.all
        render json: @beaches
      end

      def show
        render json: @beach
      end

      def create
        @beach = Beach.new(beach_params)
        if @beach.save
          render json: @beach
        else
          render json: {status: 'ERROR', message: 'A new beach was not able to be created', data: beach.errors}, status: :unproccessable_entity
        end
      end

      def update
        if @beach.update(beach_params)
          render json: @beach
        else
          render json: {status: 'ERROR', message: 'A new beach was not able to be updated', data: beach.errors}, status: :unproccessable_entity
        end
      end

      def destroy
        @beach.destroy
        render json: @beach
      end

      private

      def beach_params
        params.require(:beach).permit(:name, :island, :location, :img)
      end

      def get_beach
        @beach = Beach.find(params[:id])
      end

    end
  end
end
