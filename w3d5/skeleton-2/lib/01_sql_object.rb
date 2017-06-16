require_relative 'db_connection'
require 'active_support/inflector'
# NB: the attr_accessor we wrote in phase 0 is NOT used in the rest
# of this project. It was only a warm up.

class SQLObject
  attr_accessor :table_name, :columns, :attributes
  def self.columns
    if @columns.nil?
      arr = DBConnection.execute2(<<-SQL)
        SELECT
          *
        FROM
          #{self.table_name}
      SQL
      @columns = arr.first.map! {|col| :"#{col}"}
    else
      @columns
    end

  end

  def self.finalize!
    self.columns.each do |col|
      define_method("#{col}") {self.attributes[:"#{col}"]}
      define_method("#{col}=") {|arg| self.attributes[:"#{col}"] = arg}
    end
  end

  def self.table_name=(table_name)
    @table_name = table_name
  end

  def self.table_name
    @table_name ||= self.to_s.tableize
  end

  def self.all
    arr = DBConnection.execute(<<-SQL)
      SELECT
        *
      FROM
        #{self.table_name}
      SQL
      self.parse_all(arr)
  end

  def self.parse_all(results)
    arr = []
    results.each do |kv|
      arr << self.new(kv)
    end
    arr
  end

  def self.find(id)
    arr = DBConnection.execute(<<-SQL)
      SELECT
        *
      FROM
        #{self.table_name}
      Where
      id = #{id}
      SQL
      self.parse_all(arr).first
    # self.all.find { |obj| obj.id == id }
  end

  def initialize(params = {})
    params.each do |key, val|
      raise "unknown attribute '#{key}'" unless self.class.columns.include?(:"#{key}")
      send(:"#{key}=", val)
    end
  end

  def attributes
    @attributes ||= {}
  end

  def attribute_values
    @attributes.values
  end

  def insert
    col_names = self.class.columns[1..-1].join(", ")
    question_marks = (["?"] * (self.class.columns.length - 1)).join(", ")
    DBConnection.execute(<<-SQL, *attribute_values)
      INSERT INTO
        #{self.class.table_name} (#{col_names})
      values
      (#{question_marks})
      SQL
      self.id = DBConnection.last_insert_row_id
  end

  def update
    col_names = self.class.columns[1..-1].map {|col| col.to_s + " = ?"}.join(", ")
    question_marks = (["?"] * (self.class.columns.length - 1)).join(", ")
    DBConnection.execute(<<-SQL, *attribute_values[1..-1], self.id)
      update
        #{self.class.table_name}
      set
        #{col_names}
      Where
        id = ?
      SQL

  end

  def save
    if self.id.nil?
      insert
    else
      update
    end
  end
end
