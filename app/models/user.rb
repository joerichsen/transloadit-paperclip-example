class User < ActiveRecord::Base

  has_attached_file :avatar,
      :styles => {
            :thumbnail => "100x100",
            :large => "300x300"
      }, 
      :storage => :s3,
      :s3_credentials => "#{Rails.root}/config/s3.yml",
      :path => ":attachment/:id/:style/:basename.:extension",
      :bucket => 'transloadit-paperclip-example'
  
end
