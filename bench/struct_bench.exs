defmodule StructBench do
  use Benchfella

  defmodule Embedded do
    use Struct

    structure do
      field :e
    end
  end

  defmodule Example do
    use Struct

    structure do
      field :a
      field :b, [:integer, :float]
      field :c, {:map, [:string, :integer]}
      field :d, Embedded
    end
  end

  bench "complex" do
    {:ok, %Example{}} =
      Example.make(%{a: "test", b: 1.42, c: %{a: "test", b: 42}, d: %{e: "embeds"}})
  end
end