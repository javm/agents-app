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
            :account_id,
            :agent_id
        )
        
        if call_params[:call_type].nil? 
            call_params[:call_type] = "inbound"
        end
        if call_params[:call_type] == "inbound"
            call_params[:contact_id] = Contact.find_by(phone_number: call_params[:caller_phone_number]).id
        else
            call_params[:contact_id] = Contact.find_by(phone_number: call_params[:receiver_phone_number]).id
        end
        call_params[:start_time] = Time.now
        @call = Call.new(call_params)
        if @call.save
            render json: @call
        else
            render json: @call.errors, status: :unprocessable_entity
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
        #@call.duration = Time.parse(@call.end_time.to_s).to_i - Time.parse(@call.start_time.to_s).to_i
        @call.save

        @agent = @call.agent
        CallDetailRecord.create(
            start_time: @call.start_time,
            end_time: @call.end_time,
            account_id: @call.account_id,
            contact_id: @call.contact_id,
            call_id: @call.id,
            agent_id: @agent.id,
            agent_name: @agent.name,
        )
        render json: @call
    end

end
