-- lua/jdtls/jdtls_setup.lua

local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')
local workspace_dir = '/Users/saran/java_workspace/' .. project_name

local config = {
  cmd = {
    -- Java Path
    '/Users/saran/.sdkman/candidates/java/current/bin/java',
    '-Declipse.application=org.eclipse.jdt.ls.core.id1',
    '-Dosgi.bundles.defaultStartLevel=4',
    '-Declipse.product=org.eclipse.jdt.ls.core.product',
    '-Dlog.protocol=true',
    '-Dlog.level=ALL',
    '-Xmx1g',
    '--add-modules=ALL-SYSTEM',
    '--add-opens',
    'java.base/java.util=ALL-UNNAMED',
    '--add-opens',
    'java.base/java.lang=ALL-UNNAMED',

    -- Eclips.jdt.ls
    '-jar',
    '/Users/saran/.local/share/nvim/mason/packages/jdtls/plugins/org.eclipse.equinox.launcher.cocoa.macosx.aarch64_1.2.900.v20240129-1338.jar',

    -- Jdtls System
    '-configuration',
    '/Users/saran/.local/share/nvim/mason/packages/jdtls/config_mac_arm',

    -- Workspace Directory
    '-data',
    workspace_dir,
  },

  root_dir = vim.fs.root(0, { '.git', 'mvnw', 'gradlew' }),
  settings = { java = {} },
  init_options = {
    bundles = {},
  },
}

require('jdtls').start_or_attach(config)
