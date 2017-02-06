class Admin::TravelSchedulesController < ApplicationController

  def new
     @setup_items = []
     Rails.application.config.schedules["travel"].each do |d| 
       @setup_items << TravelScheduleItem.new(:name => d)
     end
   end

end
