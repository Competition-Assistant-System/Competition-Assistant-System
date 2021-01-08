class NoticesController < ApplicationController
  def new
    @notice = Notice.new
  end

  def create
    @notice = Notice.new(notice_params) #使用 “Notice 健壮参数”

    if @notice.save
      redirect_to notice_path @notice.id # 可以省略@notice.id，rails会自动解析重定向
    else
      render 'new' # 简写代码render :partial => "new"
    end
  end

  def show
    @notice = Notice.find(params[:id]) #搜索 Notice 的 id
  end

  def update
    @notice = Notice.find(params[:id])

    if @notice.update(notice_params)
      redirect_to notice_path @notice.id # 可以省略@notice.id，rails会自动解析
    else
      render 'edit'
    end
  end
  
  def index
    @notices = Notice.all
  end
  
  private
  
  def notice_params  # 设定 “Notice 健壮参数”
    params.require(:notice).permit(:title, :text)
  end
end
