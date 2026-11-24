local vars = require("vars")
local maxWorkspaces = vars.presistent_workspaces
local primary = vars.monitor1

for i = 1, maxWorkspaces do
  hl.workspace_rule({
    workspace = tostring(i),
    monitor = primary,
    persistent = true,
    default = (i == 1),
  })
end
