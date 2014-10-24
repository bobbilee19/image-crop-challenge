class ImagesController < ApplicationController
  def new
  end

  def create
    convert_file(params[:source])
    redirect_to "/#{cropped_file_name}"
  end

  private

  def public_directory_for(name)
    Rails.root.join("public", name)
  end

  def convert_file(file)
    system("convert #{file.path} -resize '#{height}x#{width}^' -gravity center -crop '#{height}x#{width}+0+0' #{public_directory_for(cropped_file_name)}")
  end

  def cropped_file_name
    [params[:name], "cropped", file.original_filename].compact.join("-").downcase
  end

  def file
    params[:source]
  end

  def height
    params[:height].presence || "70"
  end

  def width
    params[:width].presence || "70"
  end
end
