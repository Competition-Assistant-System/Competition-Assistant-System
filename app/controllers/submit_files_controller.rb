class SubmitFilesController < ApplicationController

  def index
    @user_id = 1
    @user = User.find_by_id(@user_id)
    @score_item = ScoreBase.all.order(:id)
  end

  def upload
    @user_id = 1
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

end
