defmodule DesafioCliTest do
  use ExUnit.Case
  import ExUnit.CaptureIO

  alias DesafioCli

  test "processa lista de nomes com numeração correta" do
    nomes_input = """
    Eduardo
    Maria
    Flavia
    Diana
    Eduardo
    Diana
    Flavia
    Joao
    Joao
    Joao
    """

    expected_output = """
    ***************************************<<<<<<<<<<>>>>>>>>>>***************************************
    ________________________________________________________________________________________________
    Ferramenta de numeração de reis e rainhas de Cumbúquia
    Digite os nomes dos reis e rainhas, um por linha. Insira uma linha em branco para finalizar.
    ________________________________________________________________________________________________
    ***************************************<<<<<<<<<<>>>>>>>>>>***************************************
    Lista de reis e rainhas com numeração:
    Eduardo I
    Maria I
    Flavia I
    Diana I
    Eduardo II
    Diana II
    Flavia II
    Joao I
    Joao II
    Joao III
    """

    output = capture_io([input: nomes_input], fn ->
      DesafioCli.main([])
    end)

    assert normalize_output(output) == normalize_output(expected_output)
  end

  test "processa lista de nomes vazia corretamente" do
    nomes_input = """

    """

    expected_output = """
    ***************************************<<<<<<<<<<>>>>>>>>>>***************************************
    ________________________________________________________________________________________________
    Ferramenta de numeração de reis e rainhas de Cumbúquia
    Digite os nomes dos reis e rainhas, um por linha. Insira uma linha em branco para finalizar.
    ________________________________________________________________________________________________
    ***************************************<<<<<<<<<<>>>>>>>>>>***************************************
    Lista de reis e rainhas com numeração:
    """

    output = capture_io([input: nomes_input], fn ->
      DesafioCli.main([])
    end)

    assert normalize_output(output) == normalize_output(expected_output)
  end


  defp normalize_output(output) do
    output
    |> String.replace("\r\n", "\n")
    |> String.trim()
  end
end
