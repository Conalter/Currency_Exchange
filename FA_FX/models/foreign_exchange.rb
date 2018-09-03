require_relative('../db/sql_runner')

class ForeignExchange

  attr_reader :country_name, :currency, :rate, :id

  def initialize( options )
    @id = options['id'].to_i
    @country_name = options['country_name']
    @currency = options['currency']
    @rate = options['amount'].to_f
    @amount = 100
  end

  def pretty_name()
    return "#{@country_name}"
  end

  def exchange()
    return @rate * @amount
  end

  def save()
    sql = "INSERT INTO foreign_exchange
    (
      country_name,
      currency,
      rate,
    )
    VALUES
    (
      $1, $2, $3
    )
    RETURNING *"
    values = [@country_name, @currency, @rate]
    exchange_data = SqlRunner.run(sql, values)
    @id = exchange_data.first()['id'].to_i
  end

  def update()
    sql = "UPDATE foreign_exchange
    SET
    (
      country_name,
      currency,
      rate,
    ) =
    (
      $1, $2, $3
    )
    WHERE id = $5"
    values = [@country_name, @currency, @rate, @id]
    SqlRunner.run( sql, values )
  end

  def self.all()
    sql = "SELECT * FROM foreign_exchange"
    exchange = SqlRunner.run( sql )
    result = exchange.map { |exchange| ForeignExchange.new( exchange ) }
    return result
  end

end
