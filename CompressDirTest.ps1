<#
.SYNOPSIS
   Compress contents of $soucrce directory to $destination
.DESCRIPTION
   Use to compress the contents of a directory into a zip file
   located in a different directory.  You cannot create the zip
   file in the same source location.
.PARAMETER <paramName>
   $systemname - randomly generated name provided by .NET
   $source - Directory with files to be compressed 
   $destination - Directory and file name 
.EXAMPLE
   
#>

$systemname = [System.IO.Path]::GetRandomFileName()
$source = "C:\Test"
$destination = "C:\Test1\chartwell_" + $systemname + ".zip"

IF (test-path $source)
{
	Add-Type -assembly "system.io.compression.filesystem"
	[io.compression.zipfile]::CreateFromDirectory($source,$destination)
}