defmodule Receive do
  def wait_for_messages do
    receive do
      {:basic_deliver, payload, _meta} ->
        IO.puts(" [x] Received #{payload}")
        wait_for_messages()
    end
  end
end

{:ok, connection} = AMQP.Connection.open()
{:ok, channel} = AMQP.Channel.open(connection)
# Queue.declare is idempotent
AMQP.Queue.declare(channel, "first")
# Tell AMQP we waitin' on the "first" queue
AMQP.Basic.consume(channel, "first", nil, no_ack: true)
IO.puts(" [*] Waiting for messages. To exit press CTRL+C, CTRL+C")

Receive.wait_for_messages()
