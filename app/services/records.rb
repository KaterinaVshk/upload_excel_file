class Records
    def get_data(id_file)
    #request to merge tables
    query = "SELECT * 
                FROM accounts as a
                JOIN groupings as g ON a.account = g.account
                JOIN account_classifications as ac ON g.group_account = ac.group_account
                Where a.datum_id = #{id_file};"
    result = ActiveRecord::Base.connection.exec_query(query)
    end
end 