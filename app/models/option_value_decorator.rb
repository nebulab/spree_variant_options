OptionValue.class_eval do

  default_scope order(:position) if table_exists?(:option_values)
    
  if defined?(SpreeHeroku)
    has_attached_file :image, 
      :styles => { :small => '40x30#', :large => '140x110#' },
      :default_style => :small,
      :path => "assets/option_values/:id/:style/:basename.:extension",
      :storage => "s3",
      :s3_credentials => "#{Rails.root}/config/s3.yml"
  else
    has_attached_file :image, 
      :styles => { :small => '40x30#', :large => '140x110#' },
      :default_style => :small,
      :url => "/assets/option_values/:id/:style/:basename.:extension",
      :path => ":rails_root/public/assets/option_values/:id/:style/:basename.:extension"
  end
  
  def has_image?
    image_file_name && !image_file_name.empty?
  end
  
end
