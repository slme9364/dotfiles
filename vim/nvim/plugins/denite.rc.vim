call denite#custom#map('insert', '<esc>', '<denite:enter_mode:normal>', 'noremap')
call denite#custom#map('insert', 'jj', '<denite:enter_mode:normal>', 'noremap')
call denite#custom#map('normal', '<esc>', '<denite:quit>', 'noremap')
nnoremap <silent> ,df :<C-u> Denite<Space>file <Return>
nnoremap <silent> ,db :<C-u> Denite<Space>buffer<Return>
