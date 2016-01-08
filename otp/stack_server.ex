defmodule StackServer do
  use GenServer
  def start_link(state) do
    GenServer.start_link(__MODULE__, state, name: :stack_server)
  end
  def pop() do
    GenServer.call(__MODULE__, :pop)
  end
  def push() do
    GenServer.cast(__MODULE__, :push)
  end
  def handle_call(:pop, _client, []) do
    {:reply, nil , []}
  end
  def handle_call(:pop, _client, [next|rest]) do
    {:reply, next, rest}
  end
  def handle_cast({:push, element_to_push}, stack) do
    {:noreply, [ element_to_push | stack ]}
  end
end
