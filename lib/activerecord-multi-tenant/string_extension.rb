# frozen_string_literal: true

require 'anbt-sql-formatter/formatter'

# Formatter for SQL queries. This is used to make the queries more readable in the tests
# When comparing SQL queries in tests, use formatter for both sides of the equation.
class String
  def pretty_format_sql
    rule = AnbtSql::Rule.new
    rule.keyword = AnbtSql::Rule::KEYWORD_UPPER_CASE
    %w[count sum substr date].each do |func_name|
      rule.function_names << func_name.upcase
    end
    rule.indent_string = '    '
    formatter = AnbtSql::Formatter.new(rule)
    formatter.format(dup)
  end
end