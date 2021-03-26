{:ok, connection} = AMQP.Connection.open()
{:ok, channel} = AMQP.Channel.open(connection)
AMQP.Queue.declare(channel, "first")
# ""=> default exchange
AMQP.Basic.publish(channel, "", "first", "Hello World!")
IO.puts(" [x] Sent 'Hello World!'")
AMQP.Connection.close(connection)
