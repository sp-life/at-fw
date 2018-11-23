#!/bin/bash

#-----------------------------------------------------------------------------
_EXPORT_VLIST=()

function def
{
    _EXPORT_VLIST=$(_def ${#_EXPORT_VLIST[@]} ${_EXPORT_VLIST[@]} $*)
}

function undef
{
    _undef $_EXPORT_VLIST
}
#-----------------------------------------------------------------------------

