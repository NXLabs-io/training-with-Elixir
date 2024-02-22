defmodule NombreProject do
  import Jason

  def get_campo(datos, campo) do
    case Jason.decode!(datos) do
      %{"firstName" => resp} when campo === "firstName" -> resp
      %{"lastName" => resp} when campo === "lastName" -> resp
      %{"age" => resp} when campo === "age" -> resp
      %{"address" => resp} -> get_valor_en_direccion(resp, campo, datos)
      _ -> "No se encontró la clave 'address' en el JSON"
    end
  end

  defp get_valor_en_direccion(resp, campo, datos) do
    case Map.get(resp, campo) do
      nil ->
        if campo === "address" do
          get_direccion_completa(datos)
        else
          "No se encontró el campo '#{campo}' dentro de 'address'"
        end
      value -> value
    end
  end

  defp get_direccion_completa(data) do
    %{
      "address" => %{
        "streetAddress" => street,
        "city" => city,
        "state" => state,
        "postalCode" => postal_code
      }
    } = Jason.decode!(data)

    "#{city} - #{postal_code} - #{state} - #{street}"
  end
end
