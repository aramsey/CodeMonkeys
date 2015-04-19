require 'securerandom'

class Admin::JudgesController < ApplicationController
    def index
        @judges = Judge.find(:all)
    end

    def create
        num = params[:number].to_i
        i = 0
        while i < num
            code = SecureRandom.hex(2)
            Judge.create!(access_code: code)            
            i = i + 1
        end
        redirect_to admin_judges_path
    end

    def clear
        Judge.destroy_all
        redirect_to admin_judges_path
    end
end