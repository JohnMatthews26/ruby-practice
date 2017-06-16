require_relative 'db_connection'
require_relative '01_sql_object'

module Searchable

  def where(params)
    where_line = (params.keys.map {|k| "#{k} = ?"}).join(" AND ")
    arg = DBConnection.execute(<<-SQL, *(params.values))
      SELECT
      *
      FROM
      #{self.table_name}
      Where
      #{where_line}
      SQL
      arr = []
      arg.each {|x| arr << self.new(x)}
      arr
  end
end

class SQLObject
  extend Searchable
end
