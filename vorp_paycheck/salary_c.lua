function a() return 'b' end
local minutes = 15
--> Minutos to give. By default is 15
Citizen.CreateThread(function(...)
	while true do
	Citizen.Wait(minutes*60000)
		TriggerServerEvent('salaryJobs:GIVE',"0x089027928098908_", a());
	end
end)
