
------------------------------------
--------- CONFIG -------------------
------------------------------------
local canServerConsoleDebugs = true 
-- Let this false to remove console prints!
------------------------------------

RegisterServerEvent("salaryJobs:GIVE")
scriptName = "vorp_salary"
local g = {}
---> Salary System
---> Made by Nukkle

------------------------------------------------------------------------------------------

-- :::: JOB l MONEY l GOLD l XP ::::: 
-- If you don't want to give gold, per exemple, leave the value on 0!

------------------------------------------------------------------------------------------
g.salaryJobs = {
{"police", 19,0,0},
{"Paramedic",19,0,0}
}
------------------------------------------------------------------------------------------

-- Salary Func()

------------------------------------------------------------------------------------------
--> _verifyAntiAbuse is for lua executors can't execute this [!!]
function g:giveSalary(_verifyAntiAbuse)
if _verifyAntiAbuse == "0x089027928098908"  then 
local source = source 
for _k,_v in pairs (g.salaryJobs) do 
	local gold ={} 
	local xp = {}
	local money = {}
	if canServerConsoleDebugs then 
	print("--------------!!!!!!!! Alerta PayCheck !!!!!!!!--------------")
	print("DEBUG: Giving salary to source: "..source)
	print("--------------------------------------------------------------")	
	end
TriggerEvent("vorp:getCharacter",source,function(user)
if user.job == _v[1] then 
							money   [source] = _v[2]
							gold    [source] = _v[3] 
							xp      [source] = _v[4]
							if canServerConsoleDebugs then 
							print("--------------!!!!!!!! Alerta PayCheck !!!!!!!!--------------")
							print("DEBUG: Giving Salary to Source: "..source.. " D_INFO>> ", money[source],gold[source],xp[source])
							print("--------------------------------------------------------------")		
							end
							--> Setagem do money,gold,xp
							if money[source]>1 then 
								TriggerEvent("vorp:addMoney", source, 0, money[source]);
							end 
							if gold[source]>1 then 
								TriggerEvent("vorp:addMoney", source, 1, gold[source]);
							end
							if xp[source]>1 then 
								TriggerEvent("vorp:addXp", source, xp[source])
							end 
							--> Reset for not double abusing
							money   [source] = 0
							gold    [source] = 0
							xp      [source] = 0
			end
		end)
	end 
else
	if canServerConsoleDebugs then 
	print("Salary: no;")
	end
end
end

------------------------------------------------------------------------------------------

-- Evento para usar a função acima no client.lua

------------------------------------------------------------------------------------------

AddEventHandler("salaryJobs:GIVE",function (_verifyAntiAbuse,_2)
	if _2 == 'b' then 
if _verifyAntiAbuse == "0x089027928098908_"  then 

g:giveSalary("0x089027928098908");
			end
		end
	end) 