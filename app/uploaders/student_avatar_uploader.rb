# encoding: utf-8
require 'pry'
class StudentAvatarUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick
  # storage :aws

  process resize_to_fit: [300, 300]

  version :thumb do
    process resize_to_fit: [195, 195]
  end

  def store_dir
    "student_photos/#{self.model.id}/"
  end

  def filename
    "#{secure_token}.#{file.extension}" if original_filename.present?
  end

  def default_url
    gravatar_id = Digest::MD5::hexdigest(self.model.email).downcase
    "http://gravatar.com/avatar/#{gravatar_id}?s=300.png"
  end

  def extension_white_list
    %w(jpg jpeg png)
  end

  protected

  def secure_token
    var = :"@#{mounted_as}_secure_token"
    model.instance_variable_get(var) or model.instance_variable_set(var, SecureRandom.uuid)
  end
end
