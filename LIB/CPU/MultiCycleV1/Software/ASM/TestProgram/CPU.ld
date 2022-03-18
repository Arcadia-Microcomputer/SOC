ENTRY(_start)

MEMORY
{
   rom (xr)  : ORIGIN = 0x80000000,  LENGTH = 512*4
   ram (rw)  : ORIGIN = 0x90000000,  LENGTH = 256*4
}

SECTIONS
{  
  .text :{
    *(.text*)
    *(.rodata*)
    _etext = . ;
  } > rom

  /* .bss section which is used for uninitialized data */
  .bss (NOLOAD):{
    _sbss = . ;
    *(.bss .bss.*)
    _ebss = . ;
  } > ram

  .data :{
    _sdata = .;
    *(.data*)
    _edata = .;
  } > ram AT > rom

  _end = . ;
} 