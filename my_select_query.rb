# # class MySelectQuery
# #     def initialize(csv_content)
# #       @data = csv_content.split("\n").map { |line| line.split(",") }
# #       @headers = @data.shift
# #     end
  
# #     def where(column_name, criteria)
# #       col_index = @headers.index(column_name)
# #       @data.select { |row| row[col_index] == criteria }.map { |row| row.join(",") }
# #    end
# #     end

# # class MySelectQuery
# #     def ishga_tushirish(cvs_contenti)
# #         @data = cvs_contenti.split("\n").map do |line|
# #             line.split("*")
# #         @header = @data.shift
# #     end
# #     def qayerga(column_name, criteria)
# #         col_index = @header.index(column_name)
# #         @data.select do |row|
# #         row[col_index] == criteria.map
# #         row.join(",")
# #     end
# # end
# # myselectquery = MySelectQuery.new
# # myselectquery.ishga_tushirish

# class MySelectQuery
#     def initialize(csv_content)
#       @data = []
#       lines = csv_content.split("\n")
#       headers = lines[0].split(",")
#       lines[1..-1].each do |line|
#         values = line.split(",")
#         if values.length == headers.length
#           record = Hash[headers.zip(values)]
#           @data << record
#         end
#       end
#     end
  
#     def where(column_name, criteria)
#       results = []
#       @data.each do |record|
#         if record[column_name] == criteria
#           result = record.values.join(",")
#           results << result
#         end
#       end
#       results
#     end
#   end

class MySelectQuery
    def initialize(csv_content)
      @data = parse_csv_content(csv_content)
    end
  
    def where(column_name, criteria)
      results = []
      @data.each do |record|
        if record[column_name] == criteria
          results << record.values.join(",")
        end
      end
      results
    end
  
    private
  
    def parse_csv_content(csv_content)
      lines = csv_content.split("\n")
      headers = lines.first.split(",")
      lines[1..-1].map do |line|
        values = line.split(",")
        next unless values.length == headers.length
  
        Hash[headers.zip(values)]
      end.compact
    end
  end