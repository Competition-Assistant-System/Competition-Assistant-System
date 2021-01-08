class Admin::BaseScoreController < Admin::ApplicationController
  before_action :set_admin_base_score, only: [:edit, :update, :destroy]

  def index
    @admin_base_scores = ScoreBase.all
  end

  def new
    @admin_base_score = ScoreBase.new
  end

  def edit
  end

  def create 
    @admin_base_score = ScoreBase.new(admin_base_score_params)

    respond_to do |format|
      if @admin_base_score.save
        format.html { redirect_to admin_base_score_index_path, flash: { success: '条目已被成功创建'} }
        format.json { render :show, status: :created, location: admin_base_score_index_path }
      else
        format.html { render :new }
        format.json { render json: @admin_base_score.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @admin_base_score.update(admin_base_score_params)
        format.html { redirect_to admin_base_score_index_path, flash: { success: '条目已被成功更新'} }
        format.json { render :show, status: :ok, location: admin_base_score_index_path }
      else
        format.html { render :edit }
        format.json { render json: @admin_base_score.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    # destory score
    @admin_base_score.score_results.destroy_all
    @admin_base_score.destroy
    respond_to do |format|
      format.html { redirect_to admin_base_score_index_path, flash: { success: '条目已被成功删除'} }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_base_score
      @admin_base_score = ScoreBase.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def admin_base_score_params
      params.fetch(:score_base, {}).permit(:base_name, :base_score, :weight)
    end

end
