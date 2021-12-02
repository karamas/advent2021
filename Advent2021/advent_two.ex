defmodule AdventTwo do

    def readChallenge(filename) do
        case File.read(Path.relative("/input/"<>filename)) do
            {:ok, body} -> body |> String.split("\r\n", trim: true) |> Enum.map(fn x -> 
                [string, num] = String.split(x) 
                {string, String.to_integer(num)}
            end)
            {:error, :enoent} -> "./input/"<>filename
        end
    end
    
    def challenge_one(filename) do
        input = readChallenge(filename)
        {horizont, depth} = Enum.reduce(input, {0, 0}, fn {order, steps}, {horizont, depth} -> 
            case order do
                "forward" -> {horizont + steps, depth}
                "down" -> {horizont, depth + steps}
                "up" -> {horizont, depth - steps}
            end
        end)
        horizont * depth
    end
    
    def challenge_two(filename) do
        input = readChallenge(filename)
        {horizont, depth, _aim} = Enum.reduce(input, {0, 0, 0}, fn {order, steps}, {horizont, depth, aim} -> 
            case order do
                "forward" -> {horizont + steps, depth + (steps * aim), aim}
                "down" -> {horizont, depth, aim + steps}
                "up" -> {horizont, depth, aim - steps}
            end
        end)
        horizont * depth
    end
end