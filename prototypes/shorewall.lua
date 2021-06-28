-- technology
local shorewall_tech = {
    type = "technology",
    name = "shorewall-tech",
    icons = {
        {
            icon = "__base__/graphics/terrain/water/hr-water-o.png",
            icon_size = 64
        },
        {
            icon = "__base__/graphics/technology/stone-wall.png",
            icon_size = 256,
            scale = 0.25
        },
    },
    effects = {
        {
            type = "unlock-recipe",
            recipe = "shorewall-recipe"
        }
    },
    prerequisites = {
        "stone-wall",
        "waterfill-tech"
    },
    unit = {
        count = 100,
        ingredients = {
            {"automation-science-pack", 1},
            {"logistic-science-pack", 1}
        },
        time = 30
    },
    order = "a"
}

-- recipe
local shorewall_recipe = {
    type = "recipe",
    name = "shorewall-recipe",
    energy_required = 0.5,
    enabled = false,
    category = "crafting",
    ingredients = {
        {
            type = "item",
            name = "stone-wall",
            amount = 1
        },
        {
            type = "item",
            name = "stone",
            amount = 10
        }
    },
    result = "shorewall-item",
    result_count = 1
}

local shorewall_item_icons = {
    {
        icon = "__base__/graphics/terrain/water/hr-water-o.png",
        icon_size = 64
    },
    {
        icon = "__base__/graphics/icons/wall.png",
        icon_size = 64,
        scale = 0.45
    }
}

-- item
local shorewall_item = {
    type = "item",
    name = "shorewall-item",
    icons = shorewall_item_icons,
    flags = {},
    subgroup = "defensive-structure",
    order = "a[wall]-a[shorewall]",
    stack_size = 100,
    place_result = "shorewall-entity"
}

-- entity
local shorewall_entity = table.deepcopy(data.raw["wall"]["stone-wall"])
local updates = {
    name = "shorewall-entity",
    icons = shorewall_item_icons,
    collision_mask = {
        -- "item-layer",    items can't be on water
        "object-layer",
        "player-layer",
        "ground-tile"
    }
}

for k, v in pairs(updates) do
    shorewall_entity[k] = updates[k]
end
shorewall_entity.minable.result = "shorewall-item"
shorewall_entity.next_upgrade = nil;

data:extend({
    shorewall_tech,
    shorewall_recipe,
    shorewall_item,
    shorewall_entity
})
