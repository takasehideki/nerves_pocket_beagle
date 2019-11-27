defmodule NervesPocketBeagle.Leds do
  @moduledoc """
  TODO
  """

  # Durations are in milliseconds
  @duration 500

  alias Nerves.Leds
  require Logger

  def blink(led_key) do
    Leds.set([{led_key, true}])
    :timer.sleep(@duration)
    Leds.set([{led_key, false}])
    :timer.sleep(@duration)
  end

  # blink LED count times
  # async execution
  # spawn(NervesPocketBeagle.Leds, :blink, [:led2, 10])
  def blink(led_key, count) do
    Leds.set([{led_key, true}])
    :timer.sleep(@duration)
    Leds.set([{led_key, false}])
    :timer.sleep(@duration)
    count = count - 1
    if count > 0 do blink(led_key, count) end
  end

  def heartbeat(led_key) do
    Leds.set([{led_key, :heartbeat}])
  end

  # :slowblink, :fastblink, :slowwink
  def blink_state(led_key, state) do
    Leds.set([{led_key, state}])
  end
end