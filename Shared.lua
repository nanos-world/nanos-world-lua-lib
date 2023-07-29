-- Overrides print to call Console Log instead
print = function(...)
	-- Table used to store the final output, which will be concatted in the end
	local buffer = {}

	-- Cache table.insert as local because it's faster
	local table_insert = table.insert

	for i = 1, select("#", ...) do
		table_insert(buffer, tostring(select(i, ...)))
		table_insert(buffer, "\t")
	end

	-- After all, concats the results
	return Console.Log(table.concat(buffer))
end

function __GetPackageName(env)
    if (env.Package and env.Package.GetName and env.Package.GetCompatibilityVersion) then
        local compat = env.Package.GetCompatibilityVersion()
        local compat_v_split = string.split(compat, ".")
        if (compat == "" or not compat) then
            return env.Package.GetPath()
        elseif ((tonumber(compat_v_split[1]) == 1 and tonumber(compat_v_split[2]) >= 49) or tonumber(compat_v_split[1]) > 1) then
            return env.Package.GetName()
        else
            return env.Package.GetPath()
        end
    end
end

function __GetCalling_ENV(level)
    local info = debug.getinfo(level, "S")
    if (info and info.source) then

        local splited_source = string.split(info.source, "/")
        if splited_source[1] then
            local package_name = splited_source[1]

            if (debug and debug.getregistry) then
                local envs = debug.getregistry().environments
                if envs then
                    for k, v in pairs(envs) do
                        if (__GetPackageName(k) == package_name) then
                            return k
                        end
                    end
                end
            end
        end
    end
end