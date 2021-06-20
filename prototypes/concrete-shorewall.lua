if mods["SchallTankPlatoon"] then
    -- technology
    local shorewall_concrete_tech = data.raw["technology"]["Schall-concrete-wall"]
    table.insert(shorewall_concrete_tech.effects, {
        type = "unlock-recipe",
        recipe = "shorewall-concrete-recipe"
    })

    -- recipe
    local shorewall_concrete_recipe = {
        type = "recipe",
        name = "shorewall-concrete-recipe",
        energy_required = 0.5,
        enabled = false,
        category = "crafting",
        ingredients = {
            {
                type = "item",
                name = "Schall-concrete-wall",
                amount = 1
            },
            {
                type = "item",
                name = "stone",
                amount = 10
            }
        },
        result = "shorewall-concrete-item",
        result_count = 1
    }

    local shorewall_concrete_item_icons = {
        {
            icon = "__base__/graphics/terrain/water/hr-water-o.png",
            icon_size = 64
        },
        {
            icon = "__SchallTankPlatoon__/graphics/icons/concrete-wall.png",
            icon_size = 64,
            scale = 0.45
        }
    }

    -- item
    local shorewall_concrete_item = {
        type = "item",
        name = "shorewall-concrete-item",
        icons = shorewall_concrete_item_icons,
        flags = {},
        subgroup = "defensive-structure",
        order = "a[wall]-a[wall]-2-shorewall",
        stack_size = 100,
        place_result = "shorewall-concrete-entity"
    }

    -- entity
    local shorewall_concrete_entity = table.deepcopy(data.raw["wall"]["Schall-concrete-wall"])
    local updates = {
        name = "shorewall-concrete-entity",
        icons = shorewall_concrete_item_icons,
        collision_mask = {
            -- "item-layer",    items can't be on water
            "object-layer",
            "player-layer",
            "ground-tile"
        }
    }

    for k, v in pairs(updates) do
        shorewall_concrete_entity[k] = updates[k]
    end
    shorewall_concrete_entity.minable.result = "shorewall-concrete-item"

    data:extend({
        shorewall_concrete_tech,
        shorewall_concrete_recipe,
        shorewall_concrete_item,
        shorewall_concrete_entity
    })
end
