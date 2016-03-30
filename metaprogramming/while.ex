defmodule Controls do


  defmacro while(condition, do: code) do
    IO.inspect code
    quote do
      try do
        # This list comprehension will not allow modify external
        # variables, we should find another solution.
        for _ <- Stream.cycle([:ok]) do
          if unquote(condition) do
            unquote(code)
          else
            throw :break
          end
        end
      catch
        :break -> :ok
      end
    end
  end

  defmacro break do
    quote do
      throw :break
    end
  end


end
