class SubmitFilesController < ApplicationController

  def index
  end

  def submit_scores
      user_id = 1
      @user = User.find_by_id(user_id)
      @user_score = 0 
      
  end
  
  def submit_files
      user_id = 1
      @user = User.find_by_id(user_id)
      @user_uploaded_file = 0 
     
  end

end
