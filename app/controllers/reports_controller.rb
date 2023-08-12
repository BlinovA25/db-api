class ReportsController < ApplicationController
  include ActionController::MimeResponds
  before_action :set_report_data, only: %i[ generate_notes_report download_notes_report ]

  def existing_reports
    folder_path = Rails.root.join('public')
    file_names = Dir.entries(folder_path).select { |entry| File.file?(File.join(folder_path, entry)) }

    render json: file_names
  end

  # downloads report by name to user' local machine
  def download_report
    file_path = Rails.root.join('public', params[:filename] + '.csv')

    send_file(
      file_path,
      filename: params[:filename] + '.csv',
      type: 'text/csv',
      disposition: 'attachment',
      data: { turbolinks: false }
    )
  end

  # generates and saves report to public folder on server
  def generate_notes_report
    timestamp = DateTime.now
    file_path = "#{Rails.root}/public/notes_#{timestamp.strftime("%Y_%b_%d_%R")}.csv"
    headers = %w[id text]

    CSV.open(file_path, 'w') do |csv|
      csv << headers

      @data.each do |row|
        csv << [row.id, row.text]
      end
    end

    render json: "File #{filename_from_path(file_path)} was successfully generated!"
  end

  # downloads report to user local machine
  def download_notes_report
    respond_to do |format|
      format.csv { send_data @data.to_csv, filename: "all_notes.csv" }
    end
  end

  private

  def set_report_data
    @data = Note.where(id: 1..3)
  end

  def filename_from_path(file_path)
    file_path.split('/').last
  end
end
