--//this is used for testing, wont be released to the public
assert(syn or http, "Unsupported exploit (should support syn.request or http.request)");

local options = ({...})[1] or { AutoDecode = true, Highlighting = true, SaveLogs = true, CLICommands = true, ShowResponse = true, BlockedURLs = {}, API = true };
local version = "v1.1.3";
local logname = string.format("%d-%s-log.txt", game.PlaceId, os.date("%d_%m_%y"));

if options.SaveLogs then
    writefile(logname, string.format("Http Logs from %s\n\n", os.date("%d/%m/%y"))) 
end;

local Serializer = loadstring(game:HttpGet("https://raw.githubusercontent.com/NotDSF/leopard/main/rbx/leopard-syn.lua"))();
local reqfunc = (syn or http).request;
local libtype = syn and "syn" or "http";
local hooked = {};
local proxied = {};
local blocked = options.BlockedURLs;
local enabled = true;

local methods = {
    HttpGet = not syn,
    HttpGetAsync = not syn,
    GetObjects = true,
    HttpPost = not syn,
    HttpPostAsync = not syn
}

Serializer.UpdateConfig({ highlighting = options.Highlighting });

local OnRequest = Instance.new("BindableEvent");

local function printf(...) 
    if options.SaveLogs then
        appendfile(logname, string.gsub(string.format(...), "%\27%[%d+m", ""));
    end;
    return print(string.format(...));
end;

local function DeepClone(tbl, cloned)
    cloned = cloned or {};
    for i,v in pairs(tbl) do
        if type(v) == "table" then
            cloned[i] = DeepClone(v);
            continue;
        end;
        cloned[i] = v;
    end;
    return cloned;
end;

local __namecall, __request;
__namecall = hookmetamethod(game, "__namecall", newcclosure(function(self, ...)
    local method = getnamecallmethod();
    if methods[method] and self.ClassName ~= "Ugc" then
        printf("game:%s(%s)\n\n", method, Serializer.FormatArguments(...));
    end;
    return __namecall(self, ...);
end));

__request = hookfunction(reqfunc, newcclosure(function(req) 
    if type(req) ~= "table" then return __request(req); end;
    
    local RequestData = DeepClone(req);
    if not enabled then return __request(req); end;
    if type(RequestData.Url) ~= "string" then return __request(req); end;

    if not options.ShowResponse then
        printf("%s.request(%s)\n\n", libtype, Serializer.Serialize(RequestData));
        return __request(req);
    end;

    local t = coroutine.running();
    coroutine.wrap(function() 
        if RequestData.Url and blocked[RequestData.Url] then
            printf("%s.request(%s) -- blocked url\n\n", libtype, Serializer.Serialize(RequestData));
            return coroutine.resume(t, {});
        end;

        OnRequest:Fire(RequestData);
        local ok, ResponseData = pcall(__request, RequestData);
        if not ok then error(ResponseData, 0); end;
        
        printf("%s.request(%s)\n\nResponse Data: %s\n\n", libtype, Serializer.Serialize(RequestData), Serializer.Serialize(ResponseData));
        coroutine.resume(t, hooked[RequestData.Url] and hooked[RequestData.Url](ResponseData) or ResponseData);
    end)();
    return coroutine.yield();
end));

for method, enabled in pairs(methods) do
    if enabled and game:FindFirstChild(method) and method ~= "Ugc" then 
        local b;
        b = hookfunction(game:GetService(method), newcclosure(function(self, ...) 
            printf("game.%s(game, %s)\n\n", method, Serializer.FormatArguments(...));
            return b(self, ...);
        end));
    end;
end;

if not debug.info(2, "f") then
    print("You are running an outdated version, please use the loadstring at https://github.com/NotDSF/HttpSpy");
end;

print(string.format("HttpSpy %s (Creator: https://github.com/NotDSF)\nLogs are saved to: %s\n\n", version, options.SaveLogs and logname or "(Logging disabled)"));

if not options.API then return end;

local API = {};
API.OnRequest = OnRequest.Event;

function API:HookSynRequest(url, hook) 
    hooked[url] = hook;
end;

function API:ProxyHost(host, proxy) 
    proxied[host] = proxy;
end;

function API:RemoveProxy(host) 
    if not proxied[host] then error("Host isn't proxied", 0); end;
    proxied[host] = nil;
end;

function API:UnHookSynRequest(url) 
    if not hooked[url] then error("URL isn't hooked", 0); end;
    hooked[url] = nil;
end;

function API:BlockUrl(url) 
    blocked[url] = true;
end;

function API:WhitelistUrl(url) 
    blocked[url] = false;
end;

return API;
