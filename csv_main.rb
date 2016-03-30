require 'csv'

  CSV.foreach('records.csv', headers: true) do |row|

    record_hash = row.to_hash # exclude the price field
    puts record_hash["user_id"]
  end # end CSV.foreach
