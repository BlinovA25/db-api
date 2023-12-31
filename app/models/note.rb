require 'csv'

class Note < ApplicationRecord

  def self.to_csv
    attributes = %w[id text]

    CSV.generate(headers: true) do |csv|
      csv << attributes

      all.each do |note|
        csv << attributes.map { |attr| note.send(attr) }
      end
    end
  end
end
