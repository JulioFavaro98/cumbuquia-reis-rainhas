defmodule DesafioCli do

  def main(_args) do
    IO.puts("***************************************<<<<<<<<<<>>>>>>>>>>***************************************")
    IO.puts("________________________________________________________________________________________________")
    IO.puts("Ferramenta de numeração de reis e rainhas de Cumbúquia")
    IO.puts("Digite os nomes dos reis e rainhas, um por linha. Insira uma linha em branco para finalizar.")
    IO.puts("________________________________________________________________________________________________")
    IO.puts("***************************************<<<<<<<<<<>>>>>>>>>>***************************************")

    nomes = ler_nomes([])
    {resultado, _} = Enum.map_reduce(nomes, %{}, fn nome, contagem_nomes ->
      {nome_atualizado, nova_contagem_nomes} = incrementar_contagem(nome, contagem_nomes)
      {nome_atualizado, nova_contagem_nomes}
    end)

    IO.puts("Lista de reis e rainhas com numeração:")
    Enum.each(resultado, &IO.puts/1)
  end

  defp ler_nomes(acumulador) do
    nome = IO.gets("")
    case nome do
      :eof -> acumulador
      _ ->
        nome = String.trim(nome)
        if nome == "" do
          acumulador
        else
          ler_nomes(acumulador ++ [nome])
        end
    end
  end

  defp incrementar_contagem(nome, contagem_nomes) do
    contagem = Map.get(contagem_nomes, nome, 0) + 1
    nome_atualizado = "#{nome} #{int_to_roman(contagem)}"
    {nome_atualizado, Map.put(contagem_nomes, nome, contagem)}
  end

  defp int_to_roman(num) do
    val = [1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1]
    syb = ["M", "CM", "D", "CD", "C", "XC", "L", "XL", "X", "IX", "V", "IV", "I"]
    build_roman(num, val, syb, "")
  end

  defp build_roman(0, _, _, roman_num), do: roman_num
  defp build_roman(num, [v | val_tail], [s | syb_tail], roman_num) when num >= v do
    build_roman(num - v, [v | val_tail], [s | syb_tail], roman_num <> s)
  end
  defp build_roman(num, [_ | val_tail], [_ | syb_tail], roman_num) do
    build_roman(num, val_tail, syb_tail, roman_num)
  end
end
