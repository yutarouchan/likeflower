class VarietiesController < ApplicationController
    before_action :authenticate_user!, only: [:new, :create]  
    def about
    end

    def rank
      @rank_varieties =  Variety.find(Like.group(:variety_id).order('count(variety_id) desc').limit(3).pluck(:variety_id))
    end

    def index
       @varieties = Variety.all.order(id: "DESC")
       
    end

    def new
      @variety = Variety.new
    end

    def create
        variety = Variety.new(variety_params)
        variety.user_id = current_user.id
      if variety.save!
        redirect_to :action => "index"
      else
        redirect_to :action => "new"
      end
    end

    def show
       @variety = Variety.find(params[:id])
       @comments = @variety.comments
        @comment = Comment.new
    end

    def edit
       @variety = Variety.find(params[:id])
    end

    def update
        variety = Variety.find(params[:id])
     if variety.update(variety_params)
        redirect_to :action => "index", :id => variety.id
      else
        redirect_to :action => "new"
    end
   end


   def destroy
     variety = Variety.find(params[:id])
     variety.destroy
     redirect_to action: :index
   end

    private
    def variety_params
      params.require(:variety).permit(:title, :about, :date, :cast, :image, :rate)
    end
end

