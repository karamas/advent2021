defmodule AdventOne do

    def readChallenge(filename) do
    
        case File.read(Path.relative("/input/"<>filename)) do
            {:ok, body} -> body |> String.split("\r\n", trim: true) |> Enum.map(fn x -> String.to_integer(x) end)
            {:error, :enoent} -> "./input/"<>filename
        end
    end

    def challenge_one(filename) do
        input = readChallenge(filename)  
        Enum.reduce(Enum.zip(input, tl(input)), 0, fn {a, b}, acc -> if a < b do acc + 1 else acc + 0 end end)
    end
    
    def challenge_two(filename) do
        input1 = readChallenge(filename)  
        input2 = tl(input1)
        input3 = tl(input2)
        result = Enum.map(Enum.zip([input1, input2, input3]), fn {a, b, c} -> a+b+c end)
        Enum.reduce(Enum.zip(result, tl(result)), 0, fn {a, b}, acc -> if a < b do acc + 1 else acc + 0 end end)
    end
    
end