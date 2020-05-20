--          _____                    _____                    _____                    _____                    _____          
--         /\    \                  /\    \                  /\    \                  /\    \                  /\    \         
--        /::\____\                /::\    \                /::\    \                /::\____\                /::\    \        
--       /::::|   |                \:::\    \              /::::\    \              /:::/    /                \:::\    \       
--      /:::::|   |                 \:::\    \            /::::::\    \            /:::/    /                  \:::\    \      
--     /::::::|   |                  \:::\    \          /:::/\:::\    \          /:::/    /                    \:::\    \     
--    /:::/|::|   |                   \:::\    \        /:::/  \:::\    \        /:::/____/                      \:::\    \    
--   /:::/ |::|   |                   /::::\    \      /:::/    \:::\    \      /::::\    \                      /::::\    \   
--  /:::/  |::|   | _____    ____    /::::::\    \    /:::/    / \:::\    \    /::::::\____\________    ____    /::::::\    \  
-- /:::/   |::|   |/\    \  /\   \  /:::/\:::\    \  /:::/    /   \:::\    \  /:::/\:::::::::::\    \  /\   \  /:::/\:::\    \ 
--/:: /    |::|   /::\____\/::\   \/:::/  \:::\____\/:::/____/     \:::\____\/:::/  |:::::::::::\____\/::\   \/:::/  \:::\____\
--\::/    /|::|  /:::/    /\:::\  /:::/    \::/    /\:::\    \      \::/    /\::/   |::|~~~|~~~~~     \:::\  /:::/    \::/    /
-- \/____/ |::| /:::/    /  \:::\/:::/    / \/____/  \:::\    \      \/____/  \/____|::|   |           \:::\/:::/    / \/____/ 
--         |::|/:::/    /    \::::::/    /            \:::\    \                    |::|   |            \::::::/    /          
--         |::::::/    /      \::::/____/              \:::\    \                   |::|   |             \::::/____/           
--         |:::::/    /        \:::\    \               \:::\    \                  |::|   |              \:::\    \           
--         |::::/    /          \:::\    \               \:::\    \                 |::|   |               \:::\    \          
--         /:::/    /            \:::\    \               \:::\    \                |::|   |                \:::\    \         
--        /:::/    /              \:::\____\               \:::\____\               \::|   |                 \:::\____\        
--        \::/    /                \::/    /                \::/    /                \:|   |                  \::/    /        
--         \/____/                  \/____/                  \/____/                  \|___|                   \/____/        

local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP","Nicki_lottery")

vRP.defInventoryItem({"nicki_lottokupon","Lottokupon","Lottokupon, skrab den og få penge.", function()
	
	local choices = {}
	
	choices["> Skrab"] = {function(player,choice,mod)
		local user_id = vRP.getUserId({player})
        if user_id ~= nil then
            TriggerClientEvent("Nicki_lottery:ProgressBars", player)
            if vRP.tryGetInventoryItem({user_id,"nicki_lottokupon", 1}) then
                vRP.closeMenu({player})
            else
            end
        end
    end}

	return choices
end, 0.50})


---------- SKRAB ----------
RegisterNetEvent("Nicki_lottery:skrab")
AddEventHandler("Nicki_lottery:skrab", function(item, count)
local user_id = vRP.getUserId({source})
local Player = vRP.getUserSource({user_id})
local randomChance = math.random(1, 100)
    if Player ~= nil then
            if randomChance < 70 then
                TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'error', text = '0 bedre held næste gang!'}, 5000)
            --  TriggerClientEvent("pNotify:SendNotification", source, {text = "0 bedre held næste gang", type = "info", timeout = (3000), layout = "bottomCenter", queue = "global"})
            elseif randomChance >= 70 and randomChance <= 90 then
                vRP.giveBankMoney({user_id,7500})
                TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = 'Du vandt 7500 DKK!'}, 5000)
            --  TriggerClientEvent("pNotify:SendNotification", source, {text = "Du vandt 7500 DKK", type = "info", timeout = (3000), layout = "bottomCenter", queue = "global"})
            elseif randomChance > 90 and randomChance < 99 then
                vRP.giveBankMoney({user_id,50000})
                TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = 'Du vandt 50000 DKK!'}, 5000)
            --  TriggerClientEvent("pNotify:SendNotification", source, {text = "Du vandt 50000 DKK", type = "info", timeout = (3000), layout = "bottomCenter", queue = "global"})
            elseif randomChance >= 99 then
                vRP.giveBankMoney({user_id,250000})
                TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'success', text = 'Du vandt Jackpot (250000) DKK!'}, 5000)
            --  TriggerClientEvent("pNotify:SendNotification", source, {text = "Du vandt jackpot (250000) DKK", type = "info", timeout = (3000), layout = "bottomCenter", queue = "global"})
            end
        end
    end)