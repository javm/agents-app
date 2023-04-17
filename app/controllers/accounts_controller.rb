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
end
