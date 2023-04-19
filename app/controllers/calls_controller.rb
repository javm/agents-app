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
        call_params = params[:call].permit(
            :caller_phone_number,
            :receiver_phone_number,
            :call_type,
            :start_time,
            :duration,
            :account_id
        )
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

    def end_call
        @call = Call.find(params[:id])
        @call.end_time = Time.now
        @call.duration = @call.end_time - @call.start_time
        @call.save

        @agent = @call.agent
        CallDetailRecord.create(
            call_type: @call.call_type,
            start_time: @call.start_time,
            end_time: @call.end_time,
            account_id: @call.account_id,
            contact_id: @call.contact_id,
            agent_id: @agent.id,
            agent_name: @agent.first_name + " " + @agent.last_name,
        )
        render json: @call
    end

end
