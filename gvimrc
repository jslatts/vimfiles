"Disable macvim key mappings
if has("gui_macvim")
  macmenu Window.Select\ Next\ Tab key=<nop>
  macmenu Window.Select\ Previous\ Tab key=<nop>
endif
