# encoding: utf-8

class StudentResumeUploader < CarrierWave::Uploader::Base
  def store_dir
    "student_files/#{self.model.id}/"
  end

  def extension_white_list
    %w(pdf)
  end

  def filename
    "resume.pdf" if original_filename
  end
end
