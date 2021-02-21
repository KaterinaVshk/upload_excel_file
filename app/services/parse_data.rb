require 'pry'
class ParseData
  
  def get_inform(properties, id_file)
    workbook = Spreadsheet.open properties[:file_attch]
    worksheets = workbook.worksheets
    #reading data from the file by sheets
    worksheets.each do |worksheet|
      worksheet.rows[8..-1].each do |row|
        if (row[0].instance_of?(String) && row[0].include?("КЛАСС ") )
          # 
          # if the records contains the name of class,
          # then add it to the table "names_classes"
          #
          @class_id = NamesClass.where(:name => row[0]).ids[0]

          unless NamesClass.where(:name => row[0]).exists?
            @class = NamesClass.create(name: row[0])
            @class_id = @class.id
          end

        elsif (row[0].instance_of?(String))
          #
          # if the account is four-digit
          # write the data in tables "accounts" and "groupings"
          #
          @account = Account.create!(account: row[0], in_assets: row[1],in_passive: row[2], credit: row[3],
                                     debit: row[4], out_assets: row[5], out_passive: row[6],datum_id: id_file)

          unless Grouping.where(:account => row[0],:group_account => row[0][0..1]).exists?
            @grouping = Grouping.create!(account: row[0], group_account: row[0][0..1])
          end

        elsif (row[0].instance_of?(Integer) || row[0].instance_of?(Float) )
          #
          # if the account is two-digit
          # write the data in tables 
          # "accounts", "groupings", "account_classifications"
          #
          @account = Account.create!(account: row[0], in_assets: row[1],in_passive: row[2], credit: row[3],
                                     debit: row[4], out_assets: row[5], out_passive: row[6],datum_id: id_file)
                              
          unless Grouping.where(:account => row[0],:group_account => row[0]).exists?
            @grouping = Grouping.create!(account: row[0], group_account: row[0])
          end   

          unless AccountClassification.where(:group_account => row[0]).exists?
            @account_classifications = AccountClassification.create!(group_account: row[0], id_class: @class_id)
          end

        end 
      end
    end
  end
end