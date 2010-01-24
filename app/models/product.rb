class Product < ActiveRecord::Base
  validates_presence_of :title, :description
  
  # Paperclip
  has_attached_file :photo, 
    :styles => {:thumb  => "50x50>", :small  => "80x80>", :medium => "125x125>", :large  => "400x400>"},
    :url  => "/assets/attachments/products/:id/:style/:basename.:extension",
    :path => ":rails_root/public/assets/attachments/products/:id/:style/:basename.:extension"
    
  #validates_attachment_size :photo, :less_than => 1.megabytes
  #validates_attachment_content_type :photo, 
  #  :content_type => ['image/pjpeg', 'image/jpeg', 'image/jpg', 'image/x-png', 'image/png', 'image/gif']
end
