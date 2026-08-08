--[[
    Init.lua - Initialization script for the web3-dev-tools gaming framework

    This script sets up the environment, loads configurations, and initializes necessary modules.
--]]

---
-- Type annotation for the initialization function
-- @return boolean: success status of init process
---
local function init(): boolean
    -- Load configurations
    local config = require('config')
    if not config then
        return false
    end

    -- Initialize core functionalities
    local core = require('core')
    if not core.initialize(config) then
        return false
    end

    -- Load utilities
    local utils = require('utils')
    utils.setup()  -- Set up utilities for the framework

    return true  -- Initialization successful
end

-- Execute initialization
local success = init()
if not success then
    error('Initialization failed')
end

print('Web3 Dev Tools initialized successfully')
