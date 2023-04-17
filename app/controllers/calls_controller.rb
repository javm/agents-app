class CallsController < ApplicationController
    def index
        @calls = Call.all
        render json: @calls
    end
    
    def show
        @call = Call.find(params[:id])
        render json: @call
    end

    def create
        call_params = params[:call].permit(:caller_phone_number, :receiver_phone_number, :duration, :account_id)
        @call = Call.new(call_params)
        if @call.save
            render json: @call
        else
            render json: @call.errors
        end
    end

    def update 
        @call = Call.find(params[:id])
        if @call.update(call_params)
            render json: @call
        else
            render json: @call.errors
        end
    end

    def destory 
        @call = Call.find(params[:id])
        @call.destroy
        render json: @call
    end

end
