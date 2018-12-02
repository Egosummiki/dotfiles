" Functions Vim Script

function Comment()
		normal _
		if (getline(".")[col(".")] == "\/")
				normal xx
		else
				normal I//
		endif
		normal j
endfunction


function CheckBrakets()
	return ( getline(".")[col(".")-2] == "(" && getline(".")[col(".")-1] == ")" || getline(".")[col(".")-1] == "\"" && getline(".")[col(".")-2] == "\"" || getline(".")[col(".")-1] == "'" && getline(".")[col(".")-2] == "'" || getline(".")[col(".")-2] == "[" && getline(".")[col(".")-1] == "]" || getline(".")[col(".")-2] == "{" && getline(".")[col(".")-1] == "}" )
endfunction

function CreateClass(dir, name)
    execute("edit " . a:dir . "/" . a:name . ".h")
    execute "normal I#pragma once\<return>//\<return> Created by ego on " . strftime("%d/%m/%y") . ".\<return>\<return>\<esc>xx"
    execute "normal oclass " . a:name . " ;\<left>{\<return>"
    w
    execute("edit " . a:dir . "/" . a:name . ".cpp")
    execute "normal I//\<return> Created by ego on " . strftime("%d/%m/%y") . ".\<return>\<return>\<esc>xx"
    execute "normal o#include \"". a:name .".h"
    w
endfunction


function GenerateDefinition()
		" Copy the method line
		normal "gyy
		" Find and copy the class name
		execute "normal ?class\<return>"
		normal W"hyiw
		" Jump to the implementation file
		execute "normal g\<tab>"
		" Jump to the end and add a new line
		normal Go
		" Paste the line and indent it back
		normal "gp<<_
		" If begins with virual remove it
		if (expand("<cword>") == "virtual")
				normal dw
		endif
		" Paste the class name for definition
		normal W"hPa::
		" Body of the definition
		execute "normal g_xa\<space>{\<return>\<return>"
		execute "normal ki\<tab>"
endfunction

function AppendLib(name)

    " Save the line number.
    let l:line_num = line(".")
    " Search for include backwards
    execute "normal ?include\<return>"
    " Add include line
    execute "normal o#include <". name .">"
    " Go to linenum.
    execute "normal :" . (l:line_num+1) . "\<return>"

endfunction

function AppendHeader(name)

    " Save the line number.
    let l:line_num = line(".")
    " Search for include backwards
    execute "normal ?include\<return>"
    " Add include line
    execute "normal o#include \"". name ."\""
    " Go to linenum.
    execute "normal :" . (l:line_num+1) . "\<return>"

endfunction

function AppendInclude()

    " Save the line number.
    let l:line_num = line(".")
    " Copy word under cursor
    normal "gyiw
    " Search for include backwards
    execute "normal ?include\<return>"
    " Add include line
    execute "normal o#include <>\<esc>\"gP"
    " Go to linenum.
    execute "normal :" . (l:line_num+1) . "\<return>"

endfunction

" Terminal Function
let g:term_buf = 0
let g:term_win = 0
function! TermToggle(height)
    if win_gotoid(g:term_win)
        hide
    else
        botright new
        exec "resize " . a:height
        try
            exec "buffer " . g:term_buf
        catch
            call termopen($SHELL, {"detach": 0})
            let g:term_buf = bufnr("")
            set nonumber
            set norelativenumber
            set signcolumn=no
        endtry
        startinsert!
        let g:term_win = win_getid()
    endif
endfunction

