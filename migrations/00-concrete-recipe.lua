if game.active_mods["SchallTankPlatoon"] then
    for index, force in pairs(game.forces) do
        local technologies = force.technologies
        local recipes = force.recipes

        recipes["shorewall-concrete-recipe"].enabled = technologies["Schall-concrete-wall"].researched
    end
end
