return{
    {
        'akinsho/toggleterm.nvim', version = "*", opts = {
            open_mapping = [[<C-h>]],
            direction = 'float',
            insert_mappings = true,
            persist_mode = true,
            float_opts = {
                border = 'rounded',
                width = 200,
                height = 48,
            }
        }
    }
}
