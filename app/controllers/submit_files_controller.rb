class SubmitFilesController < ApplicationController

  def submit
    @uploaded_file = UploadedFile.new(params[:uploaded_file])
    unless request.get?
        @uploaded_file.uploaded_file_url = uploadfile(@uploaded_file.uploaded_file_url)
        @uploaded_file.save
    end
  end

  def uploadfile(file)
    if !file.original_filename.empty?
      @filename = file.original_filename
      #设置目录路径，如果目录不存在，生成新目录
      FileUtils.mkdir("#{Rails.root}/public/upload") unless File.exist?("#{Rails.root}/public/upload")
      #写入文件
      ##wb 表示通过二进制方式写，可以保证文件不损坏
      File.open("#{Rails.root}/public/upload/#{@filename}", "wb") do |f|
        f.write(file.read)
      end
      return @filename
    end
  end

end
