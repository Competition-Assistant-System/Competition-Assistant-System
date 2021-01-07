class FileUpload < ApplicationRecord
    belongs_to :user

    File_target = "/public/files/"
    validates :file_name, presence: true
    validates :file_md5, presence: true
    validates :file_size, presence: true


    def get_file_path
        return File.join(Rails.root,FileUpload::File_target,self.file_md5)
    end

    #删除文件
    def delete_file
        file_path = File.join(Rails.root,FileUpload::File_target,self.file_md5)
        if File.exist?(file_path)
            File.delete(file_path)
        end
    end

    def upload_file file
        if File.exist?(file)
            ext_name = File.extname(file)
            self.file_name = File.basename(file)
            # clac md5
            self.file_md5 = File.basename(file, ext_name) + "_" + clac_file_md5(file) + ext_name
            # clac size
            self.file_size = File.size(file)
            # change name
            file_path = File.join(Rails.root,FileUpload::File_target,self.file_md5)
            # rename(move)
            File.rename(file, file_path)
        end
    end
    
    def clac_file_md5(file)
        Digest::MD5.hexdigest(File.open(file, "rb") { |f| "#{f.read}" })
    end
end
