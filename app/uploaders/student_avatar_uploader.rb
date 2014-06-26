# encoding: utf-8

class StudentAvatarUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  storage :aws

  def store_dir
    "student_photos/"
  end

  def default_url(student)
    gravatar_id = Digest::MD5::hexdigest(student.email).downcase
    "http://gravatar.com/avatar/#{gravatar_id}.png"
  end

  def extension_white_list
    %w(jpg jpeg png)
  end
end
