class SubmitFilesController < ApplicationController
  before_action :get_user
  before_action :set_score_result, only: [:edit, :update]
  before_action :upload_check, only: [:edit, :update, :upload, :destroy, :download]

  def index
    @score_item = ScoreBase.all.order(:id)
  end

  def edit 
    @score_base = ScoreBase.find_by_id(params[:id])
  end

  def update
    respond_to do |format|
      if @score_result.update(score_params)
        format.html { redirect_to submit_files_path, flash: { success: '条目已被成功更新'} }
        format.json { render :show, status: :ok, location: submit_files_path }
      else
        format.html { render :edit }
        format.json { render json: @score_result.errors, status: :unprocessable_entity }
      end
    end
  end

  def upload
    @user_id = current_user.id
    if request.post?
      # save file to path
      uploaded_io = params[:upload_file]
      if uploaded_io.nil?
        redirect_to submit_files_path, flash: { danger: '传输的文件不能为空' }
      else
        filename = File.join(Rails.root, FileUpload::File_target, uploaded_io.original_filename)
        File.open(filename, 'wb') do |file|
          file.write(uploaded_io.read)
        end

        uploaded_file = FileUpload.new(user_id: @user_id)
        # do some calc
        uploaded_file.upload_file filename
        if uploaded_file.save
          respond_to do |format|
            format.html { redirect_to(submit_files_path, flash: { success: '成功上传文件' }) }
            format.xml  { head :ok }
          end
        else
          respond_to do |format|
            format.html { redirect_to(submit_files_path, flash: { danger: '上传文件失败' }) }
            format.xml  { head :ok }
          end
        end
      end
    end
  end

  def destroy
    file = FileUpload.find_by_id(params[:id])
    if file == nil
      flash.now[:danger] = '该记录已被删除'
      redirect_to submit_files_path
    else
      # delete file
      file.delete_file
      # delete record
      file.destroy
      respond_to do |format|
        format.html { redirect_to(submit_files_path, flash: { success: '该记录已被删除' }) }
        format.xml  { head :ok }
      end
    end    
  end

  def download
    file = FileUpload.find_by_id(params[:id])
    if file == nil
      redirect_to submit_files_path, flash: { danger: '没有记录，下载失败！' }
    else
      file_path = file.get_file_path
      if File.exist?(file_path)
        send_file("#{file_path}",
          filename: "#{file.file_name}",
          type: "application/octet-stream")
      else
        redirect_to submit_files_path, flash: { danger: '文件不存在，下载失败！' }
      end
    end
  end

  private
    def get_user
      @user = User.find_by_id(current_user.id)
      if @user.nil?
        flash[:danger] = "系统错误"
        redirect_to submit_files_path
      end
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_score_result
      @score_result = helpers.find_user_score_result_by_id params[:id]
    end

    # Only allow a list of trusted parameters through.
    def score_params
      params.fetch(:score_result, {}).permit(:score_origin)
    end

    def upload_check
      unless can_upload?
        flash[:danger] = "您没有上传的权限"
        redirect_to submit_files_path
      end
    end

end
