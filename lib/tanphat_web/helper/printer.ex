defmodule TanphatWeb.Printer do
    def translate_data(map, field) when is_atom(field) do
        translate_data(map, Atom.to_string(field), Map.get(map, field))
    end
    
    def translate_data(map, field, default \\ nil) when is_bitstring(field) do
        Map.get(map, String.to_atom("#{field}_#{Gettext.get_locale()}")) || default
    end
end