function main() local Pattern = 2225073858507201; -- Get the ModSec collections local Headers = m.getvars("REQUEST_HEADERS"); local Args = m.getvars("ARGS"); for i = 1, #Headers do FilteredPattern,NumChanges=string.gsub(Headers[i].value, "[.]", "") if string.gmatch(FilteredPattern, Pattern) then m.setvar("tx.floatingpointdos", Headers[i].name) return ("Potential Floating Point DoS Attack via variable: " ..Headers[i].name .. "."); end end for i = 1, #Args do FilteredPattern,NumChanges=string.gsub(Args[i].value, "[.]", "") if string.gmatch(FilteredPattern, Pattern) then m.setvar("tx.floatingpointdos", Args[i].name) return ("Potential Floating Point DoS Attack via variable: " ..Args[i].name .. "."); end end return nil; end