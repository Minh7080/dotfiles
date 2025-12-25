return {
  'TiagoMDG/react-comp-gen.nvim',
  name = 'react-component-generator',
  config = function()
    require('react-component-generator').setup({
      file_extension = 'jsx',
    })
  end,
}
