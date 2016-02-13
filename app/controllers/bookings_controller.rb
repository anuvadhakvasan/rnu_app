class BookingsController < ApplicationController
    def new
        @shifts = Shift.all.map  {|s| [ s.name, s.id ] }
        @editors = Editor.all.map{|e| [ e.name, e.id ] }
        @typists = Typist.all.map{|t| [ t.name, t.id ] }
        @readers = Reader.all.map{|r| [ r.name, r.id ] }
    end
    
    def create
        @booking = Booking.new(booking_params)
          if @booking.save
             redirect_to booking_path(@booking)
          else
             render 'new'
          end
    end
    
    def show
    end
    
    def index
        #session.clear
        
        
        @years = (2016..2018).each.map {|y| [y, y]}
        months = %w(Jan Feb Mar Apr May Jun Jul Aug Sep Oct Nov Dec)
        @months = months.each.map{|m| [m, months.index(m) + 1]}
        
        @shifts = Shift.all.map  {|s| [ s.name, s.id ] }
        @editors = Editor.all.map{|e| [ e.name, e.id ] }
        @typists = Typist.all.map{|t| [ t.name, t.id ] }
        @readers = Reader.all.map{|r| [ r.name, r.id ] }
         
        
         if !params["year"] && !params["month"] && session["year"] && session["month"]
                
               redirect_to bookings_path( "year" => session["year"], "month" => session["month"], :look => params[:look]) and return
             
         
         
         elsif !params["year"] && !params["month"]
            
               redirect_to bookings_path( "year" => "2016", "month" => "1") and return             
        end
         
        
        
        @year = params["year"].to_i
        @month = params["month"].to_i
        
        s_day = Date.new(@year,@month,1)
        #s_day = Date.new(2016,1,1)
        e_day = s_day.end_of_month
        
        #@filter_hash = params[:look]
         @filter_hash = ActiveSupport::HashWithIndifferentAccess.new(params[:look])
        
        @bookings = Booking.where("date >= :start_date AND date <= :end_date",
   {start_date:  s_day, end_date:  e_day}).order( :shift_id, :date)
   
        
        
#         if @year
#           #@bookings = @bookings.where("strftime('%Y', date) + 0 = ?", @year)
#           @bookings = Booking.where("date >= :start_date AND date <= :end_date",
#   {start_date:  boy, end_date:  eoy})
#         end
        
#         if @month
#             #@bookings = @bookings.where("strftime('%m', date) + 0 = ?", @month)
          
#         end 
        
        if @filter_hash
            
              @filter_hash.each do |key, value|
                  @filter_hash.delete(key) if value == ""
              end
            @bookings = @bookings.where(@filter_hash).order(:shift_id, :date)

            
        end    
            
    session["year"] = params["year"]
    session["month"] = params["month"] 
    
    #session.clear

    end 
    

    
    def edit
        @booking = Booking.find(params[:id])
        @shifts = Shift.all.map{|s| [ s.name, s.id ] }
        @editors = Editor.all.map{|e| [ e.name, e.id ] }
        @typists = Typist.all.map{|t| [ t.name, t.id ] }
        @readers = Reader.all.map{|r| [ r.name, r.id ] }
       
    end
   
    
    def update
          @booking = Booking.find params[:id]
          @booking.update_attributes!(booking_params)
          redirect_to bookings_path
        
    end    
    
    
   private
    def booking_params
        params.require(:booking).permit(:date, :shift_id, :editor_id, :typist_id, :reader_id )
    
    end        
end
