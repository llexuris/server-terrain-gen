local Generation = {}	

-- Services --
local RunService = game:GetService("RunService")

function Generation.Generate(size)
	RunService.Heartbeat:Wait()

	local VoxelHolder = workspace.Voxels

	local FogScreenSize = size
	local resolution = 100
	local frequency = 3
	local amplitude = 10	

	local function GetHeight(x, z)
		local NoiseHeight = math.noise(x / resolution * frequency, z / resolution * frequency)
		NoiseHeight = math.clamp(NoiseHeight, -0.5, 0.5) + 0.5

		return NoiseHeight
	end

	for x = 0, FogScreenSize do
		for z = 0, FogScreenSize do
			local part = Instance.new("Part")
			part.Parent = VoxelHolder
			part.Anchored = true
			part.Size = Vector3.new(1, 1, 1)

			local height = GetHeight(x, z)

			part.Position = Vector3.new(x, height * amplitude, z)
			part.Color = Color3.new(height, height, height)

		end

		RunService.Heartbeat:Wait()
	end
end

return Generation
