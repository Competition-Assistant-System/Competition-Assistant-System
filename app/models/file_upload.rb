class FileUpload < ApplicationRecord
    belongs_to :user

    File_extname = [".rar",".7z",".zip"]
    File_target = "/public/files/"
    validates :file_name, presence: true
    validates :file_md5, presence: true
    validates :file_size, presence: true


    def get_file_path
        return FileUpload::File_target + self.file_md5
    end

    #删除文件
    def delete_file
        file_path = File.join(Rails.root,FileUpload::File_target,self.file_md5)
        if File.exist?(file_path)
            File.delete(file_path)
        end
    end
end
