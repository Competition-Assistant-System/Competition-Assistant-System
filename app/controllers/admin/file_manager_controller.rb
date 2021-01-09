class Admin::FileManagerController < Admin::ApplicationController
  def index
    @user = User.all
  end

  def destroy
    file = FileUpload.find_by_id(params[:id])
    if file == nil
      flash.now[:danger] = '该记录已被删除'
      redirect_to admin_file_manager_index_path
    else
      # delete file
      file.delete_file
      # delete record
      file.destroy
      respond_to do |format|
        format.html { redirect_to(admin_file_manager_index_path, flash: { success: '该记录已被删除' }) }
        format.xml  { head :ok }
      end
    end    
  end

  def download
    file = FileUpload.find_by_id(params[:id])
    if file == nil
      redirect_to admin_file_manager_index_path, flash: { danger: '没有记录，下载失败！' }
    else
      file_path = file.get_file_path
      if File.exist?(file_path)
        send_file("#{file_path}",
          filename: "#{file.file_name}",
          type: "application/octet-stream")
      else
        redirect_to admin_file_manager_index_path, flash: { danger: '文件不存在，下载失败！' }
      end
    end
  end

  def download_multi_file

  end

end
