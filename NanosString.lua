--[[ Nanos String Library --]]

NanosString = {}

--[[

    NanosString.FormatArgs
        desc: A better string.Format, replace `{num}` by the corresponding vararg in a string
        exemple: NanosString.FormatArgs( "Hello {2} I'm {1}", "a noob", "world!" )
        output: "Hello world! I'm a noob"

]]--

function NanosString.FormatArgs( sStr, ... )
    sStr = ( sStr or "" )
    for iArg, sArg in ipairs{ ... } do
        sStr = string.gsub( sStr, "{" .. tonumber( iArg ) .. "}", tostring( sArg ) )
    end

    return sStr
end