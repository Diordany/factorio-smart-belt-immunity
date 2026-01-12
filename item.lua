--[[
Smart Belt Immunity
Copyright (C) 2022 Jason Fortit
Copyright (C) 2026 Diordany van Hemert

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <https://www.gnu.org/licenses/>.
]]--

-- Smart Belt Immunity Equipment [Item]
local smartBeltImmunityItem = table.deepcopy(data.raw["item"]["belt-immunity-equipment"])
smartBeltImmunityItem.name = "smart-belt-immunity-equipment"
smartBeltImmunityItem.icons = {
    {
        icon = smartBeltImmunityItem.icon,
        tint = {r=1,g=0.5,b=1,a=1}
    },
}
smartBeltImmunityItem.place_as_equipment_result = "smart-belt-immunity-equipment"

-- Smart Belt Immunity Equipment [Equipment]

    -- ENABLED
    local smartBeltImmunity = table.deepcopy(data.raw["belt-immunity-equipment"]["belt-immunity-equipment"])
    smartBeltImmunity.name = "smart-belt-immunity-equipment"
    smartBeltImmunity.sprite = {
        filename = "__base__/graphics/equipment/belt-immunity-equipment.png",
        width = 32,
        height = 32,
        tint = {r=1,g=0.5,b=1,a=1}
    }

    -- Seems a bit hacky; gotta review this further later.
    -- DISABLED
    local smartBeltImmunityDisabled = table.deepcopy(smartBeltImmunity)
    smartBeltImmunityDisabled.name = "smart-belt-immunity-equipment-DISABLED"
    smartBeltImmunityDisabled.type = "movement-bonus-equipment"
    smartBeltImmunityDisabled.movement_bonus = 0
    smartBeltImmunityDisabled.background_color = {r=1,g=0,b=0,a=0.3}
    smartBeltImmunityDisabled.take_result = "smart-belt-immunity-equipment"

-- Smart Belt Immunity Equipment [Recipe]

local smartBeltImmunityRecipe = table.deepcopy(data.raw["recipe"]["efficiency-module"])
smartBeltImmunityRecipe.name = "smart-belt-immunity-equipment"
smartBeltImmunityRecipe.ingredients = {
  {type="item", name="belt-immunity-equipment", amount=1},
  {type="item", name="efficiency-module", amount=1}
}
smartBeltImmunityRecipe.results = {{type="item", name="smart-belt-immunity-equipment", amount=1}}

-- Extending the data.raw table
data:extend{smartBeltImmunityItem, smartBeltImmunity, smartBeltImmunityDisabled, smartBeltImmunityRecipe}


-- Smart Belt Immunity Equipment [Extending the data.raw.technology table]

data.raw.technology["belt-immunity-equipment"].effects = {
    data.raw.technology["belt-immunity-equipment"].effects[1],
    {
        type = "unlock-recipe",
        recipe = "smart-belt-immunity-equipment"
    }
}

