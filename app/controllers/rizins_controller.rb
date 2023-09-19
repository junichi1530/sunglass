class RizinsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
    if params[:search].present?
      # 部分検索かつ複数検索
      search = params[:search]
      @rizins = Rizin.joins(:user).where("brand1 LIKE ? OR name1 LIKE ? OR price1 LIKE ?", "%#{search}%", "%#{search}%", "%#{search}%")
    else
      @rizins = Rizin.all
    end
    @rank_rizins = Rizin.all.sort {|a,b| b.liked_users.count <=> a.liked_users.count}
  end

  def new
    @rizin = Rizin.new
  end

  def show
    @rizin = Rizin.find(params[:id])
  end

  def create
    rizin = Rizin.new(rizin_params)
    rizin.user_id = current_user.id
    if rizin.save!
        redirect_to :action => "index"
    else
        redirect_to :action => "new"
    end
end

  def edit
    @rizin = Rizin.find(params[:id])
  end

  def update
   
    rizin = Rizin.find(params[:id])
    if rizin.update(rizin_params)
        redirect_to :action => "show", :id => rizin.id
    else
        redirect_to :action => "new"
    end
  end
  def destroy
    rizin = Rizin.find(params[:id])
    rizin.destroy
    redirect_to action: :index
  end

private

def rizin_params
  params.require(:rizin).permit(:brand1, :price1, :name1, :image1)
 end
end