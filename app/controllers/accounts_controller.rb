class AccountsController < ApplicationController

    def index
        @accounts = Account.all
        render json: @accounts
    end
    
    def show
        @account = Account.find(params[:id])
        render json: @account
    end 
    
    def create
        @account = Account.new(account_params)
        if @account.save
            render json: @account
        else
            render json: @account.errors
        end
    end
    
    def update
        @account = Account.find(params[:id])
        if @account.update(account_params)
            render json: @account
        else
            render json: @account.errors
        end
    end

    def destory
        @account = Account.find(params[:id])
        @account.destroy
        render json: @account
    end

    def contacts
        @account = Account.find(params[:id])
        @contacts = @account.contacts
        @contacts_ordered = @contacts.group_by { |contact| 
            contact.last_name[0]
        }
        render json: @contacts_ordered
    end

    def calls
        @account = Account.find(params[:id])
        @calls = @account.calls
        render json: @calls
    end

    def get_contact_calls
        @account = Account.find(params[:id])
        @contact = @account.contacts.find(params[:cid])
        @calls = @contact.calls
        @call_detail_records = @calls.map { |call|
            call_detail_record = CallDetailRecord.find_by(call_id: call.id)
        }
        render json: @call_detail_records
    end
end
